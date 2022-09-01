<?php

test('The zlib extension is loaded', function () {
  expect(extension_loaded('zlib'))->toBeTrue();
});
