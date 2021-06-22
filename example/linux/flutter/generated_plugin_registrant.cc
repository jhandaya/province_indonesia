//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <province_indonesia/province_indonesia_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) province_indonesia_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ProvinceIndonesiaPlugin");
  province_indonesia_plugin_register_with_registrar(province_indonesia_registrar);
}
