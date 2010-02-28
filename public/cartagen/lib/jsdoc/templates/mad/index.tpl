<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="content-type"        content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type"  content="text/css" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta name="generator" content="JsDoc Toolkit {+JsDoc.VERSION+}" />
<title>{+data.mad.title+}</title>
<link href="default.css" type="text/css" rel="stylesheet" media="all" />
<script src="default.js" type="text/javascript"></script>

</head>
<body id="pagetop">
<div id="body">



<!--============= HEADER ============-->
<div id="header">
	<ul>
		<li><a href="index.html">{+data.mad.title+}</a></li>
	</ul>
</div>
<!--============ /HEADER ============-->



<div id="layout">



<!--============ OVERVIEW ===========-->
<div id="overview">
	<div class="desc">
		<h1>{+data.mad.title+}</h1>
		<p class="date">Updated: {+new Date().toUTCString()+}</p>
		<if test="data.mad.desc">
			<p class="desc">{+data.mad.desc+}</p>
		</if>
	</div>
	<div class="spec">
		<div class="head"></div>
		<div class="body">
			<table cellspacing="0">
				<if test="data.mad.version">
					<tr>
						<th>Version</th>
						<td>{+data.mad.version+}</td>
					</tr>
				</if>
				<if test="data.mad.author">
					<tr>
						<th>Author</th>
						<td>{+data.mad.author+}</td>
					</tr>
				</if>
				<if test="data.mad.copyright">
					<tr>
						<th>Copyright</th>
						<td>{+data.mad.copyright+}</td>
					</tr>
				</if>
				<if test="data.mad.license">
					<tr>
						<th>License</th>
						<td>{+data.mad.license+}</td>
					</tr>
				</if>
			</table>
		</div>
		<div class="foot"></div>
		<if test="data.mad.download">
			<div class="download"><a href="{+data.mad.download+}">Download source files</a></div>
		</if>
	</div>
</div>
<!--=========== /OVERVIEW ===========-->



<!--============= INDEX =============-->
<div id="index">
	{! cnt = 0; !}
	<table cellspacing="0">
	<for each="file" in="data.files">
		<if test="cnt % 4 == 0"><tr></if>
		<td>
			<h2><a href="{+file.file+}">{+file.name+}</a></h2>
			<if test="!file.is_page">
				<p>{+file.desc+}</p>
				<if test="file.constructors.length">
					<h3>Constructors</h3>
					<ul>
						<for each="cons" in="file.constructors.sort()">
							<li><a href="{+file.file+}#{+cons+}">{+cons+}</a></li>
						</for>
					</ul>
				</if>
				<if test="file.objects.length">
					<h3>Objects</h3>
					<ul>
						<for each="obj" in="file.objects.sort()">
							<li><a href="{+file.file+}#{+obj+}">{+obj+}</a></li>
						</for>
					</ul>
				</if>
			</if>
		</td>
		<if test="cnt % 4 == 3"></tr></if>
		{! cnt++; !}
	</for>
	<if test="cnt % 4 != 0"></tr></if>
	</table>
</div>
<!--============ /INDEX =============-->



</div>



<!--============= FOOTER ============-->
<div id="footer">
	<ul>
		<li>
			{+data.mad.title+}<if test="data.mad.version"> {+data.mad.version+}</if>.
		</li>
		<li>
			Generated by
			<a href="http://jsdoctoolkit.org/">JsDoc Toolkit</a> {+JsDoc.VERSION+}
			with <a href="http://lib.metatype.jp/madtemplate/">mad template</a>.
		</li>
		<if test="data.mad.copyright">
			<li>
				{+data.mad.copyright+}
			</li>
		</if>
	</ul>
</div>
<!--============ /FOOTER ============-->



</div>
</body>
</html>