<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns="http://www.w3.org/1999/xhtml"
>
  <xsl:output
    method="html"
    version="5.0"
    encoding="UTF-8"
    indent="yes"
    media-type="text/html"
    doctype-system="about:html"
  />

  <xsl:template match="*[local-name()='feed'] | *[local-name()='rss']">
    <html>
      <head>
        <title>
          <xsl:value-of select="*[local-name()='title'][1]" />
        </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style type="text/css">
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
          }
          .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
          }
          header {
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 20px;
          }
          header h1 {
            margin: 0;
            font-size: 2em;
          }
          header h1 a {
            color: #000;
            text-decoration: none;
          }
          header .subtitle {
              color: #777;
              margin-top: 5px;
          }
          header .meta {
              margin-top: 10px;
              font-size: 0.9em;
              color: #555;
          }
          .entry {
            margin-bottom: 25px;
            padding-bottom: 25px;
            border-bottom: 1px solid #eee;
          }
          .entry:last-child {
              border-bottom: none;
          }
          .entry h2 {
            margin: 0 0 10px 0;
            font-size: 1.5em;
          }
          .entry h2 a {
            color: #222;
            text-decoration: none;
          }
          .entry h2 a:hover {
              color: #0056b3;
          }
          .entry .entry-meta {
              font-size: 0.8em;
              color: #888;
              margin-bottom: 10px;
          }
          .entry .entry-content {
              margin-top: 15px;
          }
          .entry .entry-content img {
              max-width: 100%;
              height: auto;
              border-radius: 4px;
          }
          footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.8em;
            color: #aaa;
          }
          a {
              color: #0056b3;
          }
          pre {
              background: #f4f4f4;
              border: 1px solid #ddd;
              border-left: 3px solid #0056b3;
              color: #666;
              page-break-inside: avoid;
              font-family: monospace;
              font-size: 15px;
              line-height: 1.6;
              margin-bottom: 1.6em;
              max-width: 100%;
              overflow: auto;
              padding: 1em 1.5em;
              display: block;
              word-wrap: break-word;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <header>
            <h1>
              <a href="{*[local-name()='link'][@rel='alternate']/@href | *[local-name()='link'][1]}">
                <xsl:value-of select="*[local-name()='title'][1]" />
              </a>
            </h1>
            <xsl:if test="*[local-name()='subtitle']">
              <div class="subtitle">
                <xsl:value-of select="*[local-name()='subtitle'][1]" />
              </div>
            </xsl:if>
            <div class="meta">
                Last updated on <xsl:value-of select="*[local-name()='updated'] | *[local-name()='lastBuildDate'] | *[local-name()='pubDate']" />
            </div>
          </header>

          <xsl:for-each select="*[local-name()='entry'] | *[local-name()='item']">
            <div class="entry">
              <h2>
                <a href="{*[local-name()='link']/@href | *[local-name()='link']}">
                  <xsl:value-of select="*[local-name()='title']" />
                </a>
              </h2>
              <div class="entry-meta">
                <xsl:value-of select="*[local-name()='published'] | *[local-name()='pubDate']" />
                <xsl:if test="*[local-name()='author']/*[local-name()='name'] | *[local-name()='creator']">
                    by <xsl:value-of select="*[local-name()='author']/*[local-name()='name'] | *[local-name()='creator']" />
                </xsl:if>
              </div>
              <div class="entry-content">
                <xsl:value-of
                  select="*[local-name()='summary'] | *[local-name()='description'] | *[local-name()='content']"
                  disable-output-escaping="yes"
                />
              </div>
            </div>
          </xsl:for-each>

          <footer>
            <p>Generated by a human with a little help from XSLT.</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>