<?php

test('The fileinfo extension is loaded', function () {
  expect(extension_loaded('fileinfo'))->toBeTrue();
});
