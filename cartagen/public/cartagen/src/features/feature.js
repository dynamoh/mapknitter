//= require "geohash"
//= require "style"

/**
 * A abstract base class for map features - nodes and ways. Should not be
 * instantiated.
 * @class
 */
var Feature = Class.create(
/** 
 * @lends Feature.prototype 
 */
{
	/**
	 * Sets defaults for tags, fillStyle, fontColor fontSize, and fontRotation
	 * @constructs
	 */
	initialize: function() {
		this.tags = new Hash()
		this.fillStyle = '#555'
		this.fontColor = '#eee'
		this.fontSize = 12
		this.fontRotation = 0
		this.opacity = 1
		this.strokeStyle = 'black'
		this.lineWidth = 0
		this._unhovered_styles = {}
		this._unclicked_styles = {}

		/**
		 * Label for this way
		 * @type Label
		 */
		this.label = new Label(this)
	},
	/**
	 * Draws this feature using shape(). Saves/restores the canvas and applies styles. Queues
	 * this feature's label in the label drawing queue.
	 */
	draw: function() {
		Cartagen.object_count++
		$C.save()

		// apply styles

		$C.fill_style(this.fillStyle)

		if (this.pattern) {
			if (!this.pattern.src) {
				var value = this.pattern
				this.pattern = new Image()
				this.pattern.src = value
			}
			$C.fill_pattern(this.pattern, 'repeat')
		}

		$C.stroke_style(this.strokeStyle)
		$C.opacity(this.opacity)
		$C.line_width(this.lineWidth)

		// let subclass do class-specific styling
		this.style()

		// draw the shape
		this.shape()
		$C.restore()

		// draw label if we're zoomed in enough
		if (Cartagen.zoom_level > 0.3) {
			Cartagen.queue_label(this.label, this.x, this.y)
		}
	},
	/**
	 * By default, does nothing, but can be overriden to perform styling operations after general
	 * feature styles have been applied but before shape() is called.
	 */
	style: Prototype.emptyFunction,
	/**
	 * Abstract method that should be overridden to draw the feature.
	 */
	shape: function() {
		$D.warn('Feature#shape should be overriden')
	},
	apply_hover_styles: function() {
		$H(this.hover).each(function(pair) {
			if (this[pair.key]) this._unhovered_styles[pair.key] = this[pair.key]
			this[pair.key] = pair.value
		}, this)
	},
	remove_hover_styles: function() {
		Object.extend(this, this._unhovered_styles)
	},
	apply_click_styles: function() {
		$H(this.mouseDown).each(function(pair) {
			if (this[pair.key]) this._unclicked_styles[pair.key] = this[pair.key]
			this[pair.key] = pair.value
		}, this)
	},
	remove_click_styles: function() {
		Object.extend(this, this._unclicked_styles)
	}
})

//= require "node"
//= require "way"
//= require "label"
