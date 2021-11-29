<?php

$finder = Symfony\CS\Finder\DefaultFinder::create()
    ->in(__DIR__ . '/lib')
    ->in(__DIR__ . '/example')
    ->in(__DIR__ . '/test');

// `multiline_array_trailing_comma` is present in `symfony` fixer

$header = file_get_contents(__DIR__ . '/header.txt');

Symfony\CS\Fixer\Contrib\HeaderCommentFixer::setHeader($header);

return Symfony\CS\Config\Config::create()
    ->fixers([
        'psr1',
        'psr2',
        'symfony',
        'short_array_syntax',
        'multiline_spaces_before_semicolon',
        'concat_with_spaces', // spaces
        'encoding',
        '-phpdoc_params', // do not align parameters in doc blocks
        '-align_double_arrow',
        '-align_equals',
        'header_comment'
    ])
    ->finder($finder);
