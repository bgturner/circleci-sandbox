<?php

test('The xmlreader extension is loaded', function () {
  expect(extension_loaded('xmlreader'))->toBeTrue();
});
