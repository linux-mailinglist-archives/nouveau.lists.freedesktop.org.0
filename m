Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0A8A6EE
	for <lists+nouveau@lfdr.de>; Mon, 12 Aug 2019 21:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E066E5C7;
	Mon, 12 Aug 2019 19:13:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6C6E5C2
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2019 19:13:24 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 44so72893006qtg.11
 for <nouveau@lists.freedesktop.org>; Mon, 12 Aug 2019 12:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=zjsjue2/i6SYdRgpGrXmaLlmo1Lo60n2tfvsNCu6PhY=;
 b=A6GJx00eit0z7SLL5KiFtH14P4SC4GUxLxSx1RAjQz8OAmU1bqO1y3cP1qN3M3A5qT
 iz05/m8vdwq1bzUxkOvjznGmXspmoPcckcxQP/Un4VhmMJTifqeKilTyXas991bv5IrF
 GsDD+Nt0xwF/+sJ1K46uZ5DVI3d7LZefjQ/U+MkeJeh4u+ldjwDm2IOSqXeM87hnrAIA
 RAHsQq94Ge0bHO04BeGHkNXRjdUdiYabiD3CtS0arbvhtnYCXY5fOeSNrQ7Xd3OuCi1z
 oB9YDuG1d3/RkVp6mvnCaqHQ06S0Pv+Jr7OkcODPiYDZYQTFnnOcPgRHCCKhokfyQhLV
 Q92Q==
X-Gm-Message-State: APjAAAWGnj9GrDyuNAVGtU9W/XPRYayg5cELGZdc7sGQreaTe6W9Zd8e
 WSM0wtpVlo5Z89b8+LZtaZ3fWNJeces=
X-Google-Smtp-Source: APXvYqyhQHSaIUfWESNxYtrf1WNBT99uoiJxc5Q3fOGPGD4A3C/qjTBsXQMnZVX4LbNqKd0kbglzzw==
X-Received: by 2002:ac8:e45:: with SMTP id j5mr18467192qti.149.1565637203451; 
 Mon, 12 Aug 2019 12:13:23 -0700 (PDT)
Received: from whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id b123sm6265077qkf.85.2019.08.12.12.13.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 12:13:22 -0700 (PDT)
Message-ID: <c526638ef31f5b8fb7782e1a4f034fcf78088c4a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org, Lukas Wunner
 <lukas@wunner.de>
Date: Mon, 12 Aug 2019 15:13:20 -0400
In-Reply-To: <20190801220117.14952-1-lyude@redhat.com>
References: <20190801220117.14952-1-lyude@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH] PCI: Use pci_reset_bus() in
 quirk_reset_lenovo_thinkpad_50_nvgpu()
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
Reply-To: lyude@redhat.com
Cc: Aaron Plattner <aplattner@nvidia.com>, Maik Freudenberg <hhfeuer@gmx.de>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Qmpvcm4sIGlzIHRoZXJlIGFueSB1cGRhdGUgb24gZ2V0dGluZyB0aGlzIGFjY2VwdGVkPwoKT24g
VGh1LCAyMDE5LTA4LTAxIGF0IDE4OjAxIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+IFNpbmNl
IHF1aXJrX252aWRpYV9oZGEoKSB3YXMgYWRkZWQgdGhlcmUncyBub3cgdHdvIG52aWRpYSBkZXZp
Y2UKPiBmdW5jdGlvbnMgb24gYW55IGxhcHRvcHMgd2l0aCBudmlkaWEgR1BVczogdGhlIEhEQSBj
b250cm9sbGVyLCBhbmQgdGhlCj4gR1BVIGl0c2VsZi4gVW5mb3J0dW5hdGVseSB0aGlzIGhhcyB0
aGUgc2lkZWFmZmVjdCBvZiBicmVha2luZwo+IHF1aXJrX3Jlc2V0X2xlbm92b190aGlua3BhZF81
MF9udmdwdSgpIHNpbmNlIHBjaV9yZXNldF9mdW5jdGlvbigpIHdhcwo+IHVzaW5nIHBjaV9wYXJl
bnRfYnVzX3Jlc2V0KCkgdG8gcmVzZXQgdGhlIEdQVSdzIHJlc3BlY3RpdmUgUENJIGJ1cywgYW5k
Cj4gcGNpX3BhcmVudF9idXNfcmVzZXQoKSBkb2VzIG5vdCB3b3JrIG9uIGJ1c3NlcyB3aGljaCBo
YXZlIG1vcmUgdGhlbiBhCj4gc2luZ2xlIGRldmljZSBmdW5jdGlvbiBwcmVzZW50Lgo+IAo+IFNv
LCBmaXggdGhpcyBieSBzaW1wbHkgY2FsbGluZyBwY2lfcmVzZXRfYnVzKCkgaW5zdGVhZCB3aGlj
aCBwcm9wZXJseQo+IHJlc2V0cyB0aGUgR1BVIGJ1cyBhbmQgYWxsIGRldmljZSBmdW5jdGlvbnMg
dW5kZXIgaXQsIGluY2x1ZGluZyBib3RoIHRoZQo+IEdQVSBhbmQgdGhlIEhEQSBjb250cm9sbGVy
Lgo+IAo+IEZpeGVzOiBiNTE2ZWE1ODZkNzEgKCJQQ0k6IEVuYWJsZSBOVklESUEgSERBIGNvbnRy
b2xsZXJzIikKPiBDYzogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gQ2M6IERhbmll
bCBEcmFrZSA8ZHJha2VAZW5kbGVzc20uY29tPgo+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fh
c0Bnb29nbGUuY29tPgo+IENjOiBBYXJvbiBQbGF0dG5lciA8YXBsYXR0bmVyQG52aWRpYS5jb20+
Cj4gQ2M6IFBldGVyIFd1IDxwZXRlckBsZWtlbnN0ZXluLm5sPgo+IENjOiBJbGlhIE1pcmtpbiA8
aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gQ2M6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQu
Y29tPgo+IENjOiBNYWlrIEZyZXVkZW5iZXJnIDxoaGZldWVyQGdteC5kZT4KPiBDYzogbGludXgt
cGNpQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvcGNpL3F1aXJrcy5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvcXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+IGluZGV4IDIwOGFh
Y2YzOTMyOS4uNDRjNGFlMWFiZDAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL3F1aXJrcy5j
Cj4gKysrIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiBAQCAtNTI1Niw3ICs1MjU2LDcgQEAgc3Rh
dGljIHZvaWQgcXVpcmtfcmVzZXRfbGVub3ZvX3RoaW5rcGFkX3A1MF9udmdwdShzdHJ1Y3QKPiBw
Y2lfZGV2ICpwZGV2KQo+ICAJICovCj4gIAlpZiAoaW9yZWFkMzIobWFwICsgMHgyMjQwYykgJiAw
eDIpIHsKPiAgCQlwY2lfaW5mbyhwZGV2LCBGV19CVUcgIkdQVSBsZWZ0IGluaXRpYWxpemVkIGJ5
IEVGSSwKPiByZXNldHRpbmdcbiIpOwo+IC0JCXJldCA9IHBjaV9yZXNldF9mdW5jdGlvbihwZGV2
KTsKPiArCQlyZXQgPSBwY2lfcmVzZXRfYnVzKHBkZXYpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJ
CQlwY2lfZXJyKHBkZXYsICJGYWlsZWQgdG8gcmVzZXQgR1BVOiAlZFxuIiwgcmV0KTsKPiAgCX0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
