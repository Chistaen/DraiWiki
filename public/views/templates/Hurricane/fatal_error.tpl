<!DOCTYPE HTML>
<html>
<head>
    <title>{$title}</title>
    <link rel="stylesheet" type="text/css" href="{$skin_url}exception" />
    <link rel="stylesheet" type="text/css" href="{$skin_url}regular_error" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body>
<div id="wrapper">
    <h1>{$title}</h1>
    <p>{$body}</p>

    {if not $detailed eq ''}<hr />
        <p>{$detailed}</p>
    {/if}
</div>
<div id="copyright">
    {$copyright}
</div>
</body>
</html>