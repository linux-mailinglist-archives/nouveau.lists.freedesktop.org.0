Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F324274801
	for <lists+nouveau@lfdr.de>; Tue, 22 Sep 2020 20:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FE7899B0;
	Tue, 22 Sep 2020 18:17:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE4899B0
 for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2020 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600798594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ReRUIqCTsX+IuqNisXR4LcNNyFu+jv/klTm+lDF0vw=;
 b=WTY9ySaWZoW8HGmxFg+Pz+OlqmP+3k7gK03TVWjLUUwaAtbT1Cy2ukcabF1FYFLQutcYye
 a9J252EI4uVVCyiDe1T1tLr2JBhRssp8U9loI+3CN+5NA4VfuP25Cjup5FKLmyqrUL++Go
 w7aEdAXZzQ99qmnBO993FvjLVCzsgss=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-7L2riDtBMlGW0137vt9szA-1; Tue, 22 Sep 2020 14:16:29 -0400
X-MC-Unique: 7L2riDtBMlGW0137vt9szA-1
Received: by mail-qv1-f70.google.com with SMTP id ct11so12187908qvb.16
 for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2020 11:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=7ReRUIqCTsX+IuqNisXR4LcNNyFu+jv/klTm+lDF0vw=;
 b=cL7hafKQikPd8RW7dp6cS3OtEbilOEf15Ydw+cdDdu0G132n7tXFBheKzwHpx5YQhv
 nfTrU9JgjbZ/uQiesHpyUX4CmdU3wj/JrZaxSmZnZG2AMw5LRp9SL1Kk8VjnJG0FvmqQ
 q/NDFiQApbceXRGaoA7DM8eS3aiIlQGu609DaXEi95kf0KgmvngHj8rD50BzetGg8nu1
 zgtsOw9tMjdiwgb9swZW7L8aBEsciB8E8+vXl4OY0oIGfhio61bhzQ6QXD/hzul4rxOK
 KSvwSPIisxy4jZ3SYTbPIAFyOrP6qXwFbuLkRzx3T8vHqIYcqX9ePh+xka+yeOz9cJHn
 S/rw==
X-Gm-Message-State: AOAM5337+2ZTqF5DL3ME0rCeqLyCZMuN7SpZyj7Qu5O4Ww7jtHkzkgZ/
 7GHhvDzm3lM4nhhSROi9zkyAdJupNCtrBPkTcltb1DiYxqvKaocPDHila9/hawuQzFNT+Ld/7aZ
 7DFqm4IWiXzeQhJWTFoVv+x1Ljw==
X-Received: by 2002:ac8:163c:: with SMTP id p57mr3241674qtj.359.1600798588836; 
 Tue, 22 Sep 2020 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3EXJPU9r5+C6An8MMWZSo1vv2pIrQFFo7suve3Tb+hpBkDpbr637NKFnBkpX4caN+KyzLLg==
X-Received: by 2002:ac8:163c:: with SMTP id p57mr3241645qtj.359.1600798588602; 
 Tue, 22 Sep 2020 11:16:28 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n1sm13100100qte.91.2020.09.22.11.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 11:16:27 -0700 (PDT)
Message-ID: <33823a73f3e506349aaf22331cc9cec8c04c72d2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tian Tao <tiantao6@hisilicon.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, airlied@redhat.com,
 pankaj.laxminarayan.bharadiya@intel.com,  alexander.deucher@amd.com,
 tiwai@suse.de, jajones@nvidia.com,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Tue, 22 Sep 2020 14:16:26 -0400
In-Reply-To: <1600766745-56543-1-git-send-email-tiantao6@hisilicon.com>
References: <1600766745-56543-1-git-send-email-tiantao6@hisilicon.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms: Remove set but not used 'ret'
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA5LTIyIGF0IDE3OjI1ICswODAwLCBUaWFuIFRhbyB3cm90ZToKPiBUaGlz
IGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nIHdpdGggIm1ha2UgVz0xIjoKPiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6IEluIGZ1bmN0aW9uIOKAmG52
NTBfbXN0bV9wcmVwYXJl4oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYzoxMzc4OjY6IHdhcm5pbmc6Cj4gdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gU2lnbmVkLW9mZi1ieTogVGlhbiBU
YW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBpbmRl
eCBiMTExZmUyLi5kMDVjNTdjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYwo+IEBAIC0xMzc5LDYgKzEzNzksOSBAQCBudjUwX21zdG1fcHJlcGFyZShzdHJ1Y3Qg
bnY1MF9tc3RtICptc3RtKQo+ICAKPiAgCU5WX0FUT01JQyhkcm0sICIlczogbXN0bSBwcmVwYXJl
XG4iLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UubmFtZSk7Cj4gIAlyZXQgPSBkcm1fZHBfdXBkYXRl
X3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7Cj4gKwlpZiAocmV0KSB7Cj4gKyAgICAgICAgICAg
ICAgICBOVl9BVE9NSUMoZHJtLCAiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQp
Owo+ICsgICAgICAgIH0KClJlbW92ZSB0aGUgYnJhY2VzIGFyb3VuZCByZXQgYW5kIHRoaXMgaXM6
CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCj4gIAo+ICAJZHJt
X2Zvcl9lYWNoX2VuY29kZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewo+
ICAJCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkg
ewotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bCAoc2hlL2hlcikKCVNvZnR3YXJlIEVuZ2luZWVyIGF0
IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
