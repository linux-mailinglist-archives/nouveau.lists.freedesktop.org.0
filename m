Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98032146E6B
	for <lists+nouveau@lfdr.de>; Thu, 23 Jan 2020 17:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2D26FDEF;
	Thu, 23 Jan 2020 16:28:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5776FCFA;
 Thu, 23 Jan 2020 14:00:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C041BB284;
 Thu, 23 Jan 2020 14:00:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Date: Thu, 23 Jan 2020 14:59:36 +0100
Message-Id: <20200123135943.24140-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jan 2020 16:28:43 +0000
Subject: [Nouveau] [PATCH v4 15/22] drm/stm: Convert to CRTC VBLANK callbacks
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VkJMQU5LIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVwcmVjYXRlZCBpbiBm
YXZvciBvZgp0aGVpciBlcXVpdmFsZW50cyBpbiBzdHJ1Y3QgZHJtX2NydGNfZnVuY3MuIENvbnZl
cnQgc3RtIG92ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICB8IDEgLQogZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3N0bS9kcnYuYwppbmRleCA0ODY5ODU2MDQxMDkuLmVhOWZjYmRjNjhiMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vc3RtL2Rydi5jCkBAIC03Miw3ICs3Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBk
cnZfZHJpdmVyID0gewogCS5nZW1fcHJpbWVfdm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAs
CiAJLmdlbV9wcmltZV92dW5tYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92dW5tYXAsCiAJLmdlbV9w
cmltZV9tbWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwKLQkuZ2V0X3ZibGFua190aW1lc3Rh
bXAgPSBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zLAogfTsKIAogc3RhdGlj
IGludCBkcnZfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKaW5kZXgg
OGI2ZDFhMjI1MmUzLi5lZTJhOGNhYzU5Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCkBAIC03MjIsNiArNzIy
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBsdGRjX2NydGNfZnVuY3Mg
PSB7CiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kZXN0
cm95X3N0YXRlLAogCS5lbmFibGVfdmJsYW5rID0gbHRkY19jcnRjX2VuYWJsZV92YmxhbmssCiAJ
LmRpc2FibGVfdmJsYW5rID0gbHRkY19jcnRjX2Rpc2FibGVfdmJsYW5rLAorCS5nZXRfdmJsYW5r
X3RpbWVzdGFtcCA9IGRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXAs
CiAJLmdhbW1hX3NldCA9IGRybV9hdG9taWNfaGVscGVyX2xlZ2FjeV9nYW1tYV9zZXQsCiB9Owog
Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
