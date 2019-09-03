Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11ACA764E
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 23:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20F4892A6;
	Tue,  3 Sep 2019 21:36:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5DB892A6;
 Tue,  3 Sep 2019 21:36:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w6so8730371lfl.2;
 Tue, 03 Sep 2019 14:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5c3lERoSBFKARRSEJjybtuQrS47BHT/FjEnyYEyNFQ4=;
 b=Kdjf4+aPsV0KC0My497IpetFjr43kJWP+GDRCuEP9nPbOm9jejanSZILRRkenNzdrY
 rtNp5fAoooD+yMWuyTQYPfwBzfbNyxm4cDa0vfnVo6RQiaOMB6xAc+ETQskFUvBqSX/B
 hTOVCN/XzSH4tpCVKiMdG29OfDyv9G4TsJl0nA5Y/MujKB60niRd68rmhMYUkqdL1d37
 1FQ34bmJOB659tNqlvETVBuYRj2t7MrCAzkcx93hpSRoxp7Nm011HBLKTYZv/0qt/ca7
 v9IGKScFMKB7SaZhUkmPzu9+8d7EBt1Vx6NF4TO66u5RWq3OJoQXhC8u7J9tV+RpjhfB
 Lvaw==
X-Gm-Message-State: APjAAAUg9PUe3sdIrI3tVgbWSCY9q8It3TWNjp0GXVRjkWeiMOidMPbC
 BAJlTkdVrIzrtmSOonXgjadgYkjjBn8wPbB6GW9qXg==
X-Google-Smtp-Source: APXvYqy2qhVjfLBh6LUVY+Z+vrZrMk+8/5OQwcJmo6NhFVQ3s89dwyA3XcD5DyAwHt4sP/Hll/Nzd4MOCtCsqEAmtqg=
X-Received: by 2002:ac2:530e:: with SMTP id c14mr11866722lfh.165.1567546571837; 
 Tue, 03 Sep 2019 14:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-7-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-7-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Sep 2019 07:35:59 +1000
Message-ID: <CAPM=9tx1vQMEsw4VjDVCbDYFUiaeHNCfP09aiSxnPnucQuB1JQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5c3lERoSBFKARRSEJjybtuQrS47BHT/FjEnyYEyNFQ4=;
 b=dxm8P2Ly/msbsWBeFRBcnitifyB3atAXYLi82sF0F0mHuVQSC6s5gkHpC87cEgYLt4
 f34KoYIhlfFxD3mXnngj8ImCRMTbWdei5YasUPMWWS/n/+jq9Wbn1kLrr0qrh7NXmfvN
 wSZjXyWYR130Jp31Zoq+YIYqVKcSCdgw1hc6bpSSOXSbjAbb7PDBY8f62BlbEa6UjUmY
 SuBoCbno0obv6HEu6lgdwrhqw237KiEFBG88Fmux0Tqbkn5Y/awAvyTtHXaneQJe9Bsy
 lxQMgKiSOohBTdUaheExu2nfYZMLqWEuzMqgOMlYr93Wxf/F0niZ4qroBYnH8aRfBgXA
 Kg2A==
Subject: Re: [Nouveau] [PATCH v2 06/27] drm/dp_mst: Combine redundant cases
 in drm_dp_encode_sideband_req()
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCA0IFNlcCAyMDE5IGF0IDA2OjQ4LCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IE5vdGljZWQgdGhpcyB3aGlsZSB3b3JraW5nIG9uIGFkZGluZyBhIGRybV9k
cF9kZWNvZGVfc2lkZWJhbmRfcmVxKCkuCj4gRFBfUE9XRVJfRE9XTl9QSFkvRFBfUE9XRVJfVVBf
UEhZIGJvdGggdXNlIHRoZSBzYW1lIHN0cnVjdCwgc28gd2UgY2FuCj4ganVzdCBjb21iaW5lIHRo
ZWlyIGNhc2VzLgoKYm90aCB1c2UgdGhlIHNhbWUgc3RydWN0IGFzIGVudW0gcGF0aCByZXNvdXJj
ZXM/CgpTaW5jZSBvdGhlcndpc2UgdGhlIHBhdGNoIGRvZXNuJ3QgbWFrZSBzZW5zZS4KCldpdGgg
dGhhdCBmaXhlZDoKUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
