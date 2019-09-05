Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96174A9DEB
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2019 11:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB1989ECD;
	Thu,  5 Sep 2019 09:12:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7BF89ECD
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2019 09:12:01 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DDDED19CF89
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2019 09:12:00 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id x21so2385872ion.10
 for <nouveau@lists.freedesktop.org>; Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YgkTckHnd+oBCtkJ3PeDRAfoIVwhj7X9BQME1lU8Rk=;
 b=MJmID51kwlrZafGWPVl4W+COjPIW6EbiY4hFA41E6IkZddVSHeVXbSA2GTDmfGTzvW
 LyDSbatHW58owgk0F9JdZ/HC13Cx27XUOFe2S7EA26NJ+IcChWCN5WLYG9zzxuP3fTEu
 dgt37QlIvW+72H3W1bZua+qRo8MHG2WV94b1AgtBN6MHgwSKkAxiaBAxcnNqN8bLdvJm
 e7VQhGy+f+TpdwPX+KfzvLQCY21weAMSMV2cUptng2GFTtIxiPi8JfSOBxw/QT6VGkZm
 hDL7Ijp4EOOnyPe/NGppAl3KpRXRdh3QOhSJFuIk9xsjdzQWjHKUaZzZ3HTwWfr22Fzk
 TubA==
X-Gm-Message-State: APjAAAV7xK5YmQZqnDLhdZVDQQY48MCRHEQM3gQh1Q3vWa66HsaxleqR
 OwuELL5tdZY1Jtpmq/V1vni3Maf7M9SxQa1bl2n533PGPQJk33+ngiaIqF00yXF8SRG+MRleIIf
 njZFEpKo14NKPBHsRw7hA4PoG1rEaVuP0b+VzGDtq4g==
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974890ioj.100.1567674720331; 
 Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrAdsLGhijKZkQDVkShWA1yVxV6uG4TFkYu7Bb2m8Nd+GkGxi48OkzyFxBIWpeZjPbwU+pUog6KRuQLHZzDhI=
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2974868ioj.100.1567674720115; 
 Thu, 05 Sep 2019 02:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190904141857.196103-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141857.196103-1-weiyongjun1@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 5 Sep 2019 11:11:49 +0200
Message-ID: <CACO55tsJt2Z-EQBpPw1=yq_jya2kJ5u5xs_xg=nhB8ZHwhjCoA@mail.gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: add missing single_release()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gVGh1LCBT
ZXAgNSwgMjAxOSBhdCA5OjE0IEFNIFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29t
PiB3cm90ZToKPgo+IFdoZW4gdXNpbmcgc2luZ2xlX29wZW4oKSBmb3Igb3BlbmluZywgc2luZ2xl
X3JlbGVhc2UoKSBzaG91bGQgYmUKPiB1c2VkLCBvdGhlcndpc2UgdGhlcmUgaXMgYSBtZW1vcnkg
bGVhay4KPgo+IFRoaXMgaXMgZGV0ZWN0ZWQgYnkgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaC4K
Pgo+IEZpeGVzOiA2ZTlmYzE3NzM5OWYgKCJkcm0vbm91dmVhdS9kZWJ1Z2ZzOiBhZGQgY29weSBv
ZiBzeXNmcyBwc3RhdGUgaW50ZXJmYWNlIHBvcnRlZCB0byBkZWJ1Z2ZzIikKPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rl
YnVnZnMuYwo+IGluZGV4IDdkZmJiYmMxYmVlYS4uMzU2OTVmNDkzMjcxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKPiBAQCAtMjAyLDYgKzIwMiw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG5vdXZlYXVfcHN0YXRlX2ZvcHMg
PSB7Cj4gICAgICAgICAub3BlbiA9IG5vdXZlYXVfZGVidWdmc19wc3RhdGVfb3BlbiwKPiAgICAg
ICAgIC5yZWFkID0gc2VxX3JlYWQsCj4gICAgICAgICAud3JpdGUgPSBub3V2ZWF1X2RlYnVnZnNf
cHN0YXRlX3NldCwKPiArICAgICAgIC5yZWxlYXNlID0gc2luZ2xlX3JlbGVhc2UsCj4gIH07Cj4K
PiAgc3RhdGljIHN0cnVjdCBkcm1faW5mb19saXN0IG5vdXZlYXVfZGVidWdmc19saXN0W10gPSB7
Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
