Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B537197590
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6B6E1E5;
	Mon, 30 Mar 2020 07:22:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381E66E860
 for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2020 21:55:55 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id g6so886723oiy.1
 for <nouveau@lists.freedesktop.org>; Mon, 02 Mar 2020 13:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vKfKsUOY1kmNs27cha01453OljZpLRYSs6gwpxgwFFo=;
 b=Spl6sPSdPBzVDjDYytSGz6Z/Ea2JtLHv/rCdUSNMqUn3L62n53wdJetj3HJWmHSumX
 nFR1WQ821AWD9M5NHulL7lrYZd+xQsrcAVPUY3zih8OXvy9M0zF87tCpQlUky/q6YjRz
 HNEg1geI7Y4k/uEAT9DGpcjPnYppBzFnaDlbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vKfKsUOY1kmNs27cha01453OljZpLRYSs6gwpxgwFFo=;
 b=sZ3+Z9Y7mjg3P4ZSHd3mGZcSy5OCZ2cHt4htwxaMXSbq7DvSegvAZKnsFC+JcABmxM
 mElps8I1yC3MlGgLZ8lXgPEuBOMnvv3wMXiTf6EK3QtHrtOi6ho+LssEupnGUBy2eJ/I
 5meWIqPB5TQOgjJVhWjZKKgyGD7LGd0sgqjlJivnhreTF2itFUkGqudH+cCtLNnWh6IT
 qKvI01A8sMA/SyLjpT24UXcCa5SYqHrf9rGfMEyPZKRO9xAIA2QpOMm0uix84sFLgUeI
 TjGxlRh1haVk3pp7QaF0Jy9XBXao0C1v694LuNu6eQZvGfL10tucH7OlxxLaaNI6DIRI
 Eq6w==
X-Gm-Message-State: ANhLgQ1o24fzlraaAQGIAsaB04U3Q7XJjtga88k9cqgaa+dWuOTstGHP
 sfqaco44DsMh1lbfXwqlEunJOUc2YuR3aKFt6sr/dA==
X-Google-Smtp-Source: ADFU+vsZzwFQVJH74wNZpm5WT3Ha2iJFV0M3Fv/+PfAj5jEt/BXU2FHV+JqZ06o+ok+Fr9+JQFI90ghWER9268Ghbr4=
X-Received: by 2002:a05:6808:298:: with SMTP id
 z24mr332440oic.101.1583186154242; 
 Mon, 02 Mar 2020 13:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-3-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-3-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Mar 2020 22:55:43 +0100
Message-ID: <CAKMK7uFKHoPrpEDpQzFS2fnr9XeuhEjA-2MxynknCindFHYEvg@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: Re: [Nouveau] [PATCH v4 02/22] drm: Add get_scanout_position() to
 struct drm_crtc_helper_funcs
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Dave Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Anholt, Eric" <eric@anholt.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Sean Paul <sean@poorly.run>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "Wentland, Harry" <harry.wentland@amd.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 "Clark, Rob" <robdclark@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMjo1OSBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBUaGUgbmV3IGNhbGxiYWNrIGdldF9zY2Fub3V0X3Bv
c2l0aW9uKCkgcmVhZHMgdGhlIGN1cnJlbnQgbG9jYXRpb24KPiBvZiB0aGUgc2Nhbm91dCBwcm9j
ZXNzLiBUaGUgb3BlcmF0aW9uIGlzIGN1cnJlbnRseSBsb2NhdGVkIGluIHN0cnVjdAo+IGRybV9k
cml2ZXIsIGJ1dCByZWFsbHkgYmVsb25ncyB0byB0aGUgQ1JUQy4gRHJpdmVycyB3aWxsIGJlIGNv
bnZlcnRlZAo+IGluIHNlcGFyYXRlIHBhdGNoZXMuCj4KPiBUbyBoZWxwIHdpdGggdGhlIGNvbnZl
cnNpb24sIHRoZSB0aW1lc3RhbXAgY2FsY3VsYXRpb24gaGFzIGJlZW4KPiBtb3ZlZCBmcm9tIGRy
bV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRwb3MoKSB0bwo+IGRybV9jcnRjX3ZibGFu
a19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXBfaW50ZXJuYWwoKS4gVGhlIGhlbHBlcgo+IGZ1
bmN0aW9uIHN1cHBvcnRzIHRoZSBuZXcgYW5kIG9sZCBpbnRlcmZhY2Ugb2YgZ2V0X3NjYW5vdXRf
cG9zaXRpb24oKS4KPiBkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zKCkgcmVt
YWlucyBhcyBhIHdyYXBwZXIgYXJvdW5kCj4gdGhlIG5ldyBmdW5jdGlvbi4KPgo+IENhbGxiYWNr
IGZ1bmN0aW9ucyByZXR1cm4gdGhlIHNjYW5vdXQgcG9zaXRpb24gZnJvbSB0aGUgQ1JUQy4gVGhl
Cj4gbGVnYWN5IHZlcnNpb24gb2YgdGhlIGludGVyZmFjZSByZWNlaXZlcyB0aGUgZGV2aWNlIGFu
ZCBwaXBlIGluZGV4LAo+IHRoZSBtb2Rlcm4gdmVyc2lvbiByZWNlaXZlcyBhIHBvaW50ZXIgdG8g
dGhlIENSVEMuIFdlIGtlZXAgdGhlCj4gbGVnYWN5IHZlcnNpb24gdW50aWwgYWxsIGRyaXZlcnMg
aGF2ZSBiZWVuIGNvbnZlcnRlZC4KPgo+IHY0Ogo+ICAgICAgICAgKiA4MC1jaGFyYWN0ZXIgbGlu
ZSBmaXhlcwo+IHYzOgo+ICAgICAgICAgKiByZWZhY3RvciBkcm1fY2FsY192Ymx0aW1lc3RhbXBf
ZnJvbV9zY2Fub3V0cG9zKCkgdG8gbWluaW1pemUKPiAgICAgICAgICAgY29kZSBkdXBsaWNhdGlv
bgo+ICAgICAgICAgKiBkZWZpbmUgdHlwZXMgZm9yIGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgY2Fs
bGJhY2tzCj4gdjI6Cj4gICAgICAgICAqIGZpeCBsb2dpY2FsIG9wIGluIGRybV9jYWxjX3ZibHRp
bWVzdGFtcF9mcm9tX3NjYW5vdXRwb3MoKQo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyw6kg
PHlhbm5pY2suZmVydHJlQHN0LmNvbT4KPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRoaXMgcGF0Y2ggY2F1c2VzIG5ldyBrZXJu
ZWxkb2MgYnVpbGQgd2FybmluZ3M6CgouL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmM6NjIz
OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyCidkZXYnIGRlc2NyaXB0aW9uIGlu
Cidkcm1fY3J0Y192YmxhbmtfaGVscGVyX2dldF92YmxhbmtfdGltZXN0YW1wX2ludGVybmFsJwou
L2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmM6NjIzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rp
b24gcGFyYW1ldGVyCidwaXBlJyBkZXNjcmlwdGlvbiBpbgonZHJtX2NydGNfdmJsYW5rX2hlbHBl
cl9nZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRlcm5hbCcKLi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zi
bGFuay5jOjYyNDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yCm1lbWJlciAnY3J0Yycg
bm90IGRlc2NyaWJlZCBpbgonZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVz
dGFtcF9pbnRlcm5hbCcKLi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jOjYyNDogd2Fybmlu
ZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlcgonZGV2JyBkZXNjcmlwdGlvbiBpbgonZHJtX2Ny
dGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRlcm5hbCcKLi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZibGFuay5jOjYyNDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFt
ZXRlcgoncGlwZScgZGVzY3JpcHRpb24gaW4KJ2RybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3Zi
bGFua190aW1lc3RhbXBfaW50ZXJuYWwnCgoKUGxlYXNlIGZpeC4KLURhbmllbAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyAgICAgICAgICAgICB8IDEwMSArKysrKysrKysr
KysrKysrKysrLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZHJ2LmggICAgICAgICAgICAgICAgICAg
IHwgICA3ICstCj4gIGluY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmggfCAg
NDcgKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oICAgICAgICAgICAgICAg
ICB8ICAyNSArKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNTcgaW5zZXJ0aW9ucygrKSwgMjMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92Ymxhbmsu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCAzMjZkYjUyZjJhZDguLjdl
OTYyYzI5NzgwYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IEBAIC0zMCw2ICszMCw3IEBACj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4g
ICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX21v
ZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAg
I2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+Cj4KPiBAQCAtNTc3LDcgKzU3OCw3IEBAIEVYUE9S
VF9TWU1CT0woZHJtX2NhbGNfdGltZXN0YW1waW5nX2NvbnN0YW50cyk7Cj4gICAqIEltcGxlbWVu
dHMgY2FsY3VsYXRpb24gb2YgZXhhY3QgdmJsYW5rIHRpbWVzdGFtcHMgZnJvbSBnaXZlbiBkcm1f
ZGlzcGxheV9tb2RlCj4gICAqIHRpbWluZ3MgYW5kIGN1cnJlbnQgdmlkZW8gc2Nhbm91dCBwb3Np
dGlvbiBvZiBhIENSVEMuIFRoaXMgY2FuIGJlIGRpcmVjdGx5Cj4gICAqIHVzZWQgYXMgdGhlICZk
cm1fZHJpdmVyLmdldF92YmxhbmtfdGltZXN0YW1wIGltcGxlbWVudGF0aW9uIG9mIGEga21zIGRy
aXZlcgo+IC0gKiBpZiAmZHJtX2RyaXZlci5nZXRfc2Nhbm91dF9wb3NpdGlvbiBpcyBpbXBsZW1l
bnRlZC4KPiArICogaWYgJmRybV9jcnRjX2hlbHBlcl9mdW5jcy5nZXRfc2Nhbm91dF9wb3NpdGlv
biBpcyBpbXBsZW1lbnRlZC4KPiAgICoKPiAgICogVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
b25seSBoYW5kbGVzIHN0YW5kYXJkIHZpZGVvIG1vZGVzLiBGb3IgZG91YmxlIHNjYW4KPiAgICog
YW5kIGludGVybGFjZWQgbW9kZXMgdGhlIGRyaXZlciBpcyBzdXBwb3NlZCB0byBhZGp1c3QgdGhl
IGhhcmR3YXJlIG1vZGUKPiBAQCAtNTk5LDI4ICs2MDAsODUgQEAgYm9vbCBkcm1fY2FsY192Ymx0
aW1lc3RhbXBfZnJvbV9zY2Fub3V0cG9zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt0aW1lX3QgKnZibGFua190aW1l
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGluX3Zi
bGFua19pcnEpCj4gIHsKPiAtICAgICAgIHN0cnVjdCB0aW1lc3BlYzY0IHRzX2V0aW1lLCB0c192
YmxhbmtfdGltZTsKPiAtICAgICAgIGt0aW1lX3Qgc3RpbWUsIGV0aW1lOwo+IC0gICAgICAgYm9v
bCB2Ymxfc3RhdHVzOwo+ICAgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOwo+IC0gICAgICAg
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7Cj4gLSAgICAgICBzdHJ1Y3QgZHJt
X3ZibGFua19jcnRjICp2YmxhbmsgPSAmZGV2LT52YmxhbmtbcGlwZV07Cj4gLSAgICAgICBpbnQg
dnBvcywgaHBvcywgaTsKPiAtICAgICAgIGludCBkZWx0YV9ucywgZHVyYXRpb25fbnM7Cj4KPiAg
ICAgICAgIGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9NT0RFU0VUKSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAgICBjcnRjID0gZHJtX2Ny
dGNfZnJvbV9pbmRleChkZXYsIHBpcGUpOwo+ICsgICAgICAgaWYgKCFjcnRjKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4KPiAtICAgICAgIGlmIChwaXBlID49IGRldi0+bnVtX2Ny
dGNzIHx8ICFjcnRjKSB7Cj4gKyAgICAgICByZXR1cm4gZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9n
ZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRlcm5hbChjcnRjLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF4X2Vycm9y
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdmJsYW5rX3RpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbl92YmxhbmtfaXJxLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3J0Yy0+aGVscGVyX3ByaXZhdGUtPmdldF9zY2Fub3V0X3Bvc2l0aW9uLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGV2LT5kcml2ZXItPmdldF9zY2Fub3V0X3Bvc2l0aW9uKTsKPiArfQo+ICtF
WFBPUlRfU1lNQk9MKGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRwb3MpOwo+ICsK
PiArLyoqCj4gKyAqIGRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXBf
aW50ZXJuYWwgLSBwcmVjaXNlIHZibGFuawo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZXN0YW1wIGhlbHBlcgo+ICsgKiBAZGV2
OiBEUk0gZGV2aWNlCj4gKyAqIEBwaXBlOiBpbmRleCBvZiBDUlRDIHdob3NlIHZibGFuayB0aW1l
c3RhbXAgdG8gcmV0cmlldmUKPiArICogQG1heF9lcnJvcjogRGVzaXJlZCBtYXhpbXVtIGFsbG93
YWJsZSBlcnJvciBpbiB0aW1lc3RhbXBzIChuYW5vc2VjcykKPiArICogICAgICAgICAgICAgT24g
cmV0dXJuIGNvbnRhaW5zIHRydWUgbWF4aW11bSBlcnJvciBvZiB0aW1lc3RhbXAKPiArICogQHZi
bGFua190aW1lOiBQb2ludGVyIHRvIHRpbWUgd2hpY2ggc2hvdWxkIHJlY2VpdmUgdGhlIHRpbWVz
dGFtcAo+ICsgKiBAaW5fdmJsYW5rX2lycToKPiArICogICAgIFRydWUgd2hlbiBjYWxsZWQgZnJv
bSBkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCkuICBTb21lIGRyaXZlcnMKPiArICogICAgIG5lZWQg
dG8gYXBwbHkgc29tZSB3b3JrYXJvdW5kcyBmb3IgZ3B1LXNwZWNpZmljIHZibGFuayBpcnEgcXVp
cmtzCj4gKyAqICAgICBpZiBmbGFnIGlzIHNldC4KPiArICogQGdldF9zY2Fub3V0X3Bvc2l0aW9u
Ogo+ICsgKiAgICAgQ2FsbGJhY2sgZnVuY3Rpb24gdG8gcmV0cmlldmUgdGhlIHNjYW5vdXQgcG9z
aXRpb24uIFNlZQo+ICsgKiAgICAgQHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MuZ2V0X3Nj
YW5vdXRfcG9zaXRpb24uCj4gKyAqIEBnZXRfc2Nhbm91dF9wb3NpdGlvbl9sZWdhY3k6Cj4gKyAq
ICAgICBDYWxsYmFjayBmdW5jdGlvbiB0byByZXRyaWV2ZSB0aGUgc2Nhbm91dCBwb3NpdGlvbi4g
U2VlCj4gKyAqICAgICBAc3RydWN0IGRybV9kcml2ZXIuZ2V0X3NjYW5vdXRfcG9zaXRpb24uCj4g
KyAqCj4gKyAqIEltcGxlbWVudHMgY2FsY3VsYXRpb24gb2YgZXhhY3QgdmJsYW5rIHRpbWVzdGFt
cHMgZnJvbSBnaXZlbiBkcm1fZGlzcGxheV9tb2RlCj4gKyAqIHRpbWluZ3MgYW5kIGN1cnJlbnQg
dmlkZW8gc2Nhbm91dCBwb3NpdGlvbiBvZiBhIENSVEMuCj4gKyAqCj4gKyAqIFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9ubHkgaGFuZGxlcyBzdGFuZGFyZCB2aWRlbyBtb2Rlcy4gRm9yIGRv
dWJsZSBzY2FuCj4gKyAqIGFuZCBpbnRlcmxhY2VkIG1vZGVzIHRoZSBkcml2ZXIgaXMgc3VwcG9z
ZWQgdG8gYWRqdXN0IHRoZSBoYXJkd2FyZSBtb2RlCj4gKyAqICh0YWtlbiBmcm9tICZkcm1fY3J0
Y19zdGF0ZS5hZGp1c3RlZCBtb2RlIGZvciBhdG9taWMgbW9kZXNldCBkcml2ZXJzKSB0bwo+ICsg
KiBtYXRjaCB0aGUgc2Nhbm91dCBwb3NpdGlvbiByZXBvcnRlZC4KPiArICoKPiArICogTm90ZSB0
aGF0IGF0b21pYyBkcml2ZXJzIG11c3QgY2FsbCBkcm1fY2FsY190aW1lc3RhbXBpbmdfY29uc3Rh
bnRzKCkgYmVmb3JlCj4gKyAqIGVuYWJsaW5nIGEgQ1JUQy4gVGhlIGF0b21pYyBoZWxwZXJzIGFs
cmVhZHkgdGFrZSBjYXJlIG9mIHRoYXQgaW4KPiArICogZHJtX2F0b21pY19oZWxwZXJfdXBkYXRl
X2xlZ2FjeV9tb2Rlc2V0X3N0YXRlKCkuCj4gKyAqCj4gKyAqIFJldHVybnM6Cj4gKyAqCj4gKyAq
IFJldHVybnMgdHJ1ZSBvbiBzdWNjZXNzLCBhbmQgZmFsc2Ugb24gZmFpbHVyZSwgaS5lLiB3aGVu
IG5vIGFjY3VyYXRlCj4gKyAqIHRpbWVzdGFtcCBjb3VsZCBiZSBhY3F1aXJlZC4KPiArICovCj4g
K2Jvb2wKPiArZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRl
cm5hbCgKPiArICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgaW50ICptYXhfZXJyb3IsIGt0
aW1lX3QgKnZibGFua190aW1lLAo+ICsgICAgICAgYm9vbCBpbl92YmxhbmtfaXJxLAo+ICsgICAg
ICAgZHJtX3ZibGFua19nZXRfc2Nhbm91dF9wb3NpdGlvbl9mdW5jIGdldF9zY2Fub3V0X3Bvc2l0
aW9uLAo+ICsgICAgICAgZHJtX3ZibGFua19nZXRfc2Nhbm91dF9wb3NpdGlvbl9sZWdhY3lfZnVu
YyBnZXRfc2Nhbm91dF9wb3NpdGlvbl9sZWdhY3kpCj4gK3sKPiArICAgICAgIHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgcGlwZSA9IGNy
dGMtPmluZGV4Owo+ICsgICAgICAgc3RydWN0IGRybV92YmxhbmtfY3J0YyAqdmJsYW5rID0gJmRl
di0+dmJsYW5rW3BpcGVdOwo+ICsgICAgICAgc3RydWN0IHRpbWVzcGVjNjQgdHNfZXRpbWUsIHRz
X3ZibGFua190aW1lOwo+ICsgICAgICAga3RpbWVfdCBzdGltZSwgZXRpbWU7Cj4gKyAgICAgICBi
b29sIHZibF9zdGF0dXM7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
bW9kZTsKPiArICAgICAgIGludCB2cG9zLCBocG9zLCBpOwo+ICsgICAgICAgaW50IGRlbHRhX25z
LCBkdXJhdGlvbl9uczsKPiArCj4gKyAgICAgICBpZiAocGlwZSA+PSBkZXYtPm51bV9jcnRjcykg
ewo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkludmFsaWQgY3J0YyAldVxuIiwgcGlwZSk7
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAg
LyogU2Nhbm91dCBwb3NpdGlvbiBxdWVyeSBub3Qgc3VwcG9ydGVkPyBTaG91bGQgbm90IGhhcHBl
bi4gKi8KPiAtICAgICAgIGlmICghZGV2LT5kcml2ZXItPmdldF9zY2Fub3V0X3Bvc2l0aW9uKSB7
Cj4gLSAgICAgICAgICAgICAgIERSTV9FUlJPUigiQ2FsbGVkIGZyb20gZHJpdmVyIHcvbyBnZXRf
c2Nhbm91dF9wb3NpdGlvbigpIT9cbiIpOwo+ICsgICAgICAgaWYgKCFnZXRfc2Nhbm91dF9wb3Np
dGlvbiAmJiAhZ2V0X3NjYW5vdXRfcG9zaXRpb25fbGVnYWN5KSB7Cj4gKyAgICAgICAgICAgICAg
IERSTV9FUlJPUigiQ2FsbGVkIGZyb20gQ1JUQyB3L28gZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSE/
XG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgfQo+Cj4gQEAg
LTYzNSw3ICs2OTMsNiBAQCBib29sIGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRw
b3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgIGlmIChtb2RlLT5jcnRjX2Nsb2Nr
ID09IDApIHsKPiAgICAgICAgICAgICAgICAgRFJNX0RFQlVHKCJjcnRjICV1OiBOb29wIGR1ZSB0
byB1bmluaXRpYWxpemVkIG1vZGUuXG4iLCBwaXBlKTsKPiAgICAgICAgICAgICAgICAgV0FSTl9P
Tl9PTkNFKGRybV9kcnZfdXNlc19hdG9taWNfbW9kZXNldChkZXYpKTsKPiAtCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIH0KPgo+IEBAIC02NTEsMTEgKzcwOCwxOSBA
QCBib29sIGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRwb3Moc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICogR2V0IHZlcnRpY2FsIGFuZCBob3Jpem9u
dGFsIHNjYW5vdXQgcG9zaXRpb24gdnBvcywgaHBvcywKPiAgICAgICAgICAgICAgICAgICogYW5k
IGJvdW5kaW5nIHRpbWVzdGFtcHMgc3RpbWUsIGV0aW1lLCBwcmUvcG9zdCBxdWVyeS4KPiAgICAg
ICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAgIHZibF9zdGF0dXMgPSBkZXYtPmRyaXZl
ci0+Z2V0X3NjYW5vdXRfcG9zaXRpb24oZGV2LCBwaXBlLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluX3ZibGFua19pcnEs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnZwb3MsICZocG9zLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdGltZSwgJmV0aW1lLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1v
ZGUpOwo+ICsgICAgICAgICAgICAgICBpZiAoZ2V0X3NjYW5vdXRfcG9zaXRpb24pIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICB2Ymxfc3RhdHVzID0gZ2V0X3NjYW5vdXRfcG9zaXRpb24oY3J0
YywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW5fdmJsYW5rX2lycSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJnZwb3MsICZocG9zLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3RpbWUsICZldGltZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbW9kZSk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdmJsX3N0YXR1cyA9IGdldF9zY2Fub3V0X3Bvc2l0aW9uX2xlZ2FjeShkZXYsIHBpcGUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbl92YmxhbmtfaXJxLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnZwb3MsICZocG9zLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnN0aW1lLCAmZXRpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb2RlKTsKPiArICAgICAgICAgICAgICAgfQo+
Cj4gICAgICAgICAgICAgICAgIC8qIFJldHVybiBhcyBuby1vcCBpZiBzY2Fub3V0IHF1ZXJ5IHVu
c3VwcG9ydGVkIG9yIGZhaWxlZC4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKCF2Ymxfc3RhdHVz
KSB7Cj4gQEAgLTcwNyw3ICs3NzIsNyBAQCBib29sIGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9t
X3NjYW5vdXRwb3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPgo+ICAgICAgICAgcmV0dXJuIHRy
dWU7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTChkcm1fY2FsY192Ymx0aW1lc3RhbXBfZnJvbV9zY2Fu
b3V0cG9zKTsKPiArRVhQT1JUX1NZTUJPTChkcm1fY3J0Y192YmxhbmtfaGVscGVyX2dldF92Ymxh
bmtfdGltZXN0YW1wX2ludGVybmFsKTsKPgo+ICAvKioKPiAgICogZHJtX2dldF9sYXN0X3ZibHRp
bWVzdGFtcCAtIHJldHJpZXZlIHJhdyB0aW1lc3RhbXAgZm9yIHRoZSBtb3N0IHJlY2VudAo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgK
PiBpbmRleCBjZjEzNDcwODEwYTUuLmQwMDQ5ZTU3ODZmYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fZHJ2LmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKPiBAQCAtMzYyLDEx
ICszNjIsOCBAQCBzdHJ1Y3QgZHJtX2RyaXZlciB7Cj4gICAgICAgICAgKiBUcnVlIG9uIHN1Y2Nl
c3MsIGZhbHNlIGlmIGEgcmVsaWFibGUgc2Nhbm91dCBwb3NpdGlvbiBjb3VudGVyIGNvdWxkCj4g
ICAgICAgICAgKiBub3QgYmUgcmVhZCBvdXQuCj4gICAgICAgICAgKgo+IC0gICAgICAgICogRklY
TUU6Cj4gLSAgICAgICAgKgo+IC0gICAgICAgICogU2luY2UgdGhpcyBpcyBhIGhlbHBlciB0byBp
bXBsZW1lbnQgQGdldF92YmxhbmtfdGltZXN0YW1wLCB3ZSBzaG91bGQKPiAtICAgICAgICAqIG1v
dmUgaXQgdG8gJnN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MsIGxpa2UgYWxsIHRoZSBvdGhl
cgo+IC0gICAgICAgICogaGVscGVyLWludGVybmFsIGhvb2tzLgo+ICsgICAgICAgICogVGhpcyBp
cyBkZXByZWNhdGVkIGFuZCBzaG91bGQgbm90IGJlIHVzZWQgYnkgbmV3IGRyaXZlcnMuCj4gKyAg
ICAgICAgKiBVc2UgJmRybV9jcnRjX2hlbHBlcl9mdW5jcy5nZXRfc2Nhbm91dF9wb3NpdGlvbiBp
bnN0ZWFkLgo+ICAgICAgICAgICovCj4gICAgICAgICBib29sICgqZ2V0X3NjYW5vdXRfcG9zaXRp
b24pIChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaW5fdmJsYW5rX2lycSwgaW50ICp2
cG9zLCBpbnQgKmhwb3MsCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hl
bHBlcl92dGFibGVzLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5o
Cj4gaW5kZXggNWE4N2YxYmQ3YTNmLi5lMzk4NTEyYmZkNWYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmgKPiBAQCAtNDUwLDYgKzQ1MCw1MyBAQCBzdHJ1Y3Qg
ZHJtX2NydGNfaGVscGVyX2Z1bmNzIHsKPiAgICAgICAgICAqLwo+ICAgICAgICAgdm9pZCAoKmF0
b21pY19kaXNhYmxlKShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUpOwo+ICsK
PiArICAgICAgIC8qKgo+ICsgICAgICAgICogQGdldF9zY2Fub3V0X3Bvc2l0aW9uOgo+ICsgICAg
ICAgICoKPiArICAgICAgICAqIENhbGxlZCBieSB2YmxhbmsgdGltZXN0YW1waW5nIGNvZGUuCj4g
KyAgICAgICAgKgo+ICsgICAgICAgICogUmV0dXJucyB0aGUgY3VycmVudCBkaXNwbGF5IHNjYW5v
dXQgcG9zaXRpb24gZnJvbSBhIENSVEMgYW5kIGFuCj4gKyAgICAgICAgKiBvcHRpb25hbCBhY2N1
cmF0ZSBrdGltZV9nZXQoKSB0aW1lc3RhbXAgb2Ygd2hlbiB0aGUgcG9zaXRpb24gd2FzCj4gKyAg
ICAgICAgKiBtZWFzdXJlZC4gTm90ZSB0aGF0IHRoaXMgaXMgYSBoZWxwZXIgY2FsbGJhY2sgd2hp
Y2ggaXMgb25seSB1c2VkCj4gKyAgICAgICAgKiBpZiBhIGRyaXZlciB1c2VzIGRybV9jYWxjX3Zi
bHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRwb3MoKSBmb3IgdGhlCj4gKyAgICAgICAgKiBAZHJtX2Ry
aXZlci5nZXRfdmJsYW5rX3RpbWVzdGFtcCBjYWxsYmFjay4KPiArICAgICAgICAqCj4gKyAgICAg
ICAgKiBQYXJhbWV0ZXJzOgo+ICsgICAgICAgICoKPiArICAgICAgICAqIGNydGM6Cj4gKyAgICAg
ICAgKiAgICAgVGhlIENSVEMuCj4gKyAgICAgICAgKiBpbl92YmxhbmtfaXJxOgo+ICsgICAgICAg
ICogICAgIFRydWUgd2hlbiBjYWxsZWQgZnJvbSBkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCkuIFNv
bWUgZHJpdmVycwo+ICsgICAgICAgICogICAgIG5lZWQgdG8gYXBwbHkgc29tZSB3b3JrYXJvdW5k
cyBmb3IgZ3B1LXNwZWNpZmljIHZibGFuayBpcnEKPiArICAgICAgICAqICAgICBxdWlya3MgaWYg
dGhlIGZsYWcgaXMgc2V0Lgo+ICsgICAgICAgICogdnBvczoKPiArICAgICAgICAqICAgICBUYXJn
ZXQgbG9jYXRpb24gZm9yIGN1cnJlbnQgdmVydGljYWwgc2Nhbm91dCBwb3NpdGlvbi4KPiArICAg
ICAgICAqIGhwb3M6Cj4gKyAgICAgICAgKiAgICAgVGFyZ2V0IGxvY2F0aW9uIGZvciBjdXJyZW50
IGhvcml6b250YWwgc2Nhbm91dCBwb3NpdGlvbi4KPiArICAgICAgICAqIHN0aW1lOgo+ICsgICAg
ICAgICogICAgIFRhcmdldCBsb2NhdGlvbiBmb3IgdGltZXN0YW1wIHRha2VuIGltbWVkaWF0ZWx5
IGJlZm9yZQo+ICsgICAgICAgICogICAgIHNjYW5vdXQgcG9zaXRpb24gcXVlcnkuIENhbiBiZSBO
VUxMIHRvIHNraXAgdGltZXN0YW1wLgo+ICsgICAgICAgICogZXRpbWU6Cj4gKyAgICAgICAgKiAg
ICAgVGFyZ2V0IGxvY2F0aW9uIGZvciB0aW1lc3RhbXAgdGFrZW4gaW1tZWRpYXRlbHkgYWZ0ZXIK
PiArICAgICAgICAqICAgICBzY2Fub3V0IHBvc2l0aW9uIHF1ZXJ5LiBDYW4gYmUgTlVMTCB0byBz
a2lwIHRpbWVzdGFtcC4KPiArICAgICAgICAqIG1vZGU6Cj4gKyAgICAgICAgKiAgICAgQ3VycmVu
dCBkaXNwbGF5IHRpbWluZ3MuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogUmV0dXJucyB2cG9z
IGFzIGEgcG9zaXRpdmUgbnVtYmVyIHdoaWxlIGluIGFjdGl2ZSBzY2Fub3V0IGFyZWEuCj4gKyAg
ICAgICAgKiBSZXR1cm5zIHZwb3MgYXMgYSBuZWdhdGl2ZSBudW1iZXIgaW5zaWRlIHZibGFuaywg
Y291bnRpbmcgdGhlIG51bWJlcgo+ICsgICAgICAgICogb2Ygc2NhbmxpbmVzIHRvIGdvIHVudGls
IGVuZCBvZiB2YmxhbmssIGUuZy4sIC0xIG1lYW5zICJvbmUgc2NhbmxpbmUKPiArICAgICAgICAq
IHVudGlsIHN0YXJ0IG9mIGFjdGl2ZSBzY2Fub3V0IC8gZW5kIG9mIHZibGFuay4iCj4gKyAgICAg
ICAgKgo+ICsgICAgICAgICogUmV0dXJuczoKPiArICAgICAgICAqCj4gKyAgICAgICAgKiBUcnVl
IG9uIHN1Y2Nlc3MsIGZhbHNlIGlmIGEgcmVsaWFibGUgc2Nhbm91dCBwb3NpdGlvbiBjb3VudGVy
IGNvdWxkCj4gKyAgICAgICAgKiBub3QgYmUgcmVhZCBvdXQuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIGJvb2wgKCpnZXRfc2Nhbm91dF9wb3NpdGlvbikoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGluX3ZibGFua19pcnEs
IGludCAqdnBvcywgaW50ICpocG9zLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBrdGltZV90ICpzdGltZSwga3RpbWVfdCAqZXRpbWUsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsK
PiAgfTsKPgo+ICAvKioKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oIGIv
aW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCj4gaW5kZXggYzE2YzQ0MDUyYjNkLi42NmQxZmIzNzY2
MDAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCj4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX3ZibGFuay5oCj4gQEAgLTIzOCw0ICsyMzgsMjkgQEAgdm9pZCBkcm1fY2FsY190
aW1lc3RhbXBpbmdfY29uc3RhbnRzKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgd2FpdF9xdWV1
ZV9oZWFkX3QgKmRybV9jcnRjX3ZibGFua193YWl0cXVldWUoc3RydWN0IGRybV9jcnRjICpjcnRj
KTsKPiAgdm9pZCBkcm1fY3J0Y19zZXRfbWF4X3ZibGFua19jb3VudChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgbWF4X3ZibGFu
a19jb3VudCk7Cj4gKwo+ICt0eXBlZGVmIGJvb2wgKCpkcm1fdmJsYW5rX2dldF9zY2Fub3V0X3Bv
c2l0aW9uX2Z1bmMpKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaW5fdmJsYW5rX2lycSwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAq
dnBvcywgaW50ICpocG9zLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAga3RpbWVfdCAqc3RpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdGltZV90ICpldGltZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlKTsKPiArCj4gK3R5cGVkZWYgYm9vbCAoKmRybV92Ymxhbmtf
Z2V0X3NjYW5vdXRfcG9zaXRpb25fbGVnYWN5X2Z1bmMpKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IHBpcGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpbl92YmxhbmtfaXJxLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCAqdnBvcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgKmhwb3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3RpbWVfdCAqc3RpbWUsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3RpbWVf
dCAqZXRpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwo+ICsK
PiArYm9vbAo+ICtkcm1fY3J0Y192YmxhbmtfaGVscGVyX2dldF92YmxhbmtfdGltZXN0YW1wX2lu
dGVybmFsKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAqbWF4X2Vycm9yLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3RpbWVfdCAqdmJsYW5r
X3RpbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBib29sIGluX3ZibGFua19pcnEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fdmJsYW5rX2dldF9zY2Fub3V0X3Bvc2l0aW9uX2Z1
bmMgZ2V0X3NjYW5vdXRfcG9zaXRpb24sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fdmJsYW5rX2dldF9zY2Fub3V0X3Bvc2l0aW9uX2xl
Z2FjeV9mdW5jIGdldF9zY2Fub3V0X3Bvc2l0aW9uX2xlZ2FjeSk7Cj4gKwo+ICAjZW5kaWYKPiAt
LQo+IDIuMjQuMQo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
