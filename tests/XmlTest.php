<?php

test('The xml extension is loaded', function () {
  expect(extension_loaded('xml'))->toBeTrue();
});
