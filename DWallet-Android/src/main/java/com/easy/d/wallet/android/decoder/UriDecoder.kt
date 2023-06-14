package com.easy.d.wallet.android.decoder

import android.net.Uri
import com.easy.d.wallet.android.decoder.StringDecoder
import javax.inject.Inject

class UriDecoder @Inject constructor() : StringDecoder {
  override fun decodeString(encodedString: String): String = Uri.decode(encodedString)
}
