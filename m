Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84110103931
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 12:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543776E3B5;
	Wed, 20 Nov 2019 11:55:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4839D6E3B5
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 11:55:02 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Qhng6nk5P8e6DrTOJS0Y9g-1; Wed, 20 Nov 2019 06:54:59 -0500
Received: by mail-qv1-f71.google.com with SMTP id 41so16982419qvw.5
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 03:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXFyh8kBLvmSj4EaxcIf64KvYzB8eENY53AuUwLsMY8=;
 b=hPK7qtWbP0aKG+7m5MDeSRqzjn8vsbu8F2VwjiNTvcaY9hvX57yBc9Oy1qbdHCF9L1
 nFuBNNSqT2HJLJ+w+cwtlK7z1PXrE1IxDB/MYdSASfgVTSDQ7LfbfvUg/tMpDepme8nw
 ev19c8HC5b1mmU7q1/qXNRpqaOH/bBHMttzRw2LuZvH9Eg2Ey8XeS5DzaEaCMY4t2B4X
 yrspCwQoYtd6sRaQa8rs9MFXUNLZQVYklma0uKmpg1FC/HWnmw+roKbA/CrX7ShXtMt8
 bqXguqu1/iVZh6r2I6cxD6csoiC4fgsJxYnavKYFgf263k0dI8SlvybzaUY5qxKyVhrm
 iqJw==
X-Gm-Message-State: APjAAAWjCW6GURPGrWPR/mT6RFlJRV3+4fZfnm39LFVD1Ci/S3kB4BfV
 LlAhJ02oSTF2MdGcGDE8zAQN5R85VvPdEzU2iOwO7+F1Q4ofNldufAB3w205cyNo5OPVSd2X3TJ
 dpQYVNh8jlvk0z9NM5EORHpM2WDb0u/kCTcheVls4Ew==
X-Received: by 2002:ac8:38cf:: with SMTP id g15mr2147346qtc.254.1574250899309; 
 Wed, 20 Nov 2019 03:54:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgzPbhFAy1Wx/TLioNWRRw8v7Dky3juARvT+xkh08MnU9EQEHgjj6TnBsmHsTkQgM/Z6Vs1zzOXcqygfmJowM=
X-Received: by 2002:ac8:38cf:: with SMTP id g15mr2147324qtc.254.1574250899096; 
 Wed, 20 Nov 2019 03:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
In-Reply-To: <20191120115127.GD11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 12:54:48 +0100
Message-ID: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: Qhng6nk5P8e6DrTOJS0Y9g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574250901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQ/suR9lwab8Vmoit+8fApDfagM+XQzhiSMoLQs89Ks=;
 b=AYizZYKO1TWC1O6Z4znilA2HErMTf+6vxlkbwQQgLOWGgwFLSBVSOiO0cyhLTx70/CQoLR
 dX5P71vvEIsfb08/hGqWHYxZrH+6ONmLZpUmZFWe7N7+AOEfw7zsPAV/StTGW+rBh4MTid
 vEjt5JEKl1AW9JgjeTRl4uqoJaOZVRI=
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Zm9yIG5ld2VyIFdpbmRvd3MgdGhlIGZpcm13YXJlIHVzZXMgYml0ICAweDgwIG9uIDB4MjQ4IChR
MEwyIGJlaW5nIHRoZQpmaWVsZCBuYW1lKSBvbiB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgdG8gdHVy
biBvZiB0aGUgZGV2aWNlLCBvbiBvdGhlcgp2ZXJzaW9ucyBpdCB1c2VzIHRoZSAib2xkZXIiPyAw
eGIwIHJlZ2lzdGVyIGFuZCB0aGUgUDBMRCBmaWVsZCwgd2hpY2gKaXMgZG9jdW1lbnRlZCwgd2hl
cmUgdGhlIGZvcm1lciBpcyBub3QuCgpPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMjo1MSBQTSBN
aWthIFdlc3RlcmJlcmcKPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MjI6MTZQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJnIHdy
b3RlOgo+ID4gICAgICAgICAgICAgSWYgKCgoT1NZUyA8PSAweDA3RDkpIHx8ICgoT1NZUyA9PSAw
eDA3REYpICYmIChfUkVWID09Cj4gPiAgICAgICAgICAgICAgICAgMHgwNSkpKSkKPiA+ICAgICAg
ICAgICAgIHsKPgo+IFRoZSBPU1lTIGNvbWVzIGZyb20gdGhpcyAoaW4gRFNEVCk6Cj4KPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMDkiKSkKPiAgICAgICAgICAgICAgICAg
ewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdEOQo+ICAgICAgICAgICAgICAgICB9
Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTIiKSkKPiAgICAgICAg
ICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdEQwo+ICAgICAgICAg
ICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTMiKSkK
PiAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdERAo+
ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dz
IDIwMTUiKSkKPiAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9
IDB4MDdERgo+ICAgICAgICAgICAgICAgICB9Cj4KPiBTbyBJIGd1ZXNzIHRoaXMgcGFydGljdWxh
ciBjaGVjayB0cmllcyB0byBpZGVudGlmeSBXaW5kb3dzIDcgYW5kIG9sZGVyLAo+IGFuZCBMaW51
eC4KPgo+ID4gICAgICAgICAgICAgICAgIElmICgoUElPRiA9PSBaZXJvKSkKPiA+ICAgICAgICAg
ICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIFAwTEQgPSBPbmUKPiA+ICAgICAgICAg
ICAgICAgICAgICAgVENOVCA9IFplcm8KPiA+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChU
Q05UIDwgTERMWSkpCj4gPiAgICAgICAgICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIElmICgoUDBMVCA9PSAweDA4KSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCcmVhawo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIFNsZWVwICgweDEw
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgVENOVCArPSAweDEwCj4gPiAgICAgICAgICAg
ICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgIFAwUk0gPSBPbmUKPiA+ICAg
ICAgICAgICAgICAgICAgICAgUDBBUCA9IDB4MDMKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAg
ICAgICAgICAgICAgICAgRWxzZUlmICgoUElPRiA9PSBPbmUpKQo+ID4gICAgICAgICAgICAgICAg
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgUDFMRCA9IE9uZQo+ID4gICAgICAgICAgICAgICAg
ICAgICBUQ05UID0gWmVybwo+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBM
RExZKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgSWYgKChQMUxUID09IDB4MDgpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgU2xlZXAgKDB4MTApCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBUQ05UICs9IDB4MTAKPiA+ICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgUDFSTSA9IE9uZQo+ID4gICAgICAgICAg
ICAgICAgICAgICBQMUFQID0gMHgwMwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAg
ICAgICAgICBFbHNlSWYgKChQSU9GID09IDB4MDIpKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgUDJMRCA9IE9uZQo+ID4gICAgICAgICAgICAgICAgICAgICBU
Q05UID0gWmVybwo+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBMRExZKSkK
PiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgSWYg
KChQMkxUID09IDB4MDgpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgU2xlZXAgKDB4MTApCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBUQ05UICs9IDB4MTAKPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+
ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgUDJSTSA9IE9uZQo+ID4gICAgICAgICAgICAgICAg
ICAgICBQMkFQID0gMHgwMwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAg
ICAgICAgSWYgKChQQkdFICE9IFplcm8pKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgSWYgKFNCREwgKFBJT0YpKQo+ID4gICAgICAgICAgICAgICAgICAgICB7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBNQkRMID0gR01YQiAoUElPRikKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIFBEVUIgKFBJT0YsIE1CREwpCj4gPiAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICB9Cj4gPiAgICAgICAg
ICAgICBFbHNlCj4gPiAgICAgICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgICAgTEtEUyAoUElP
RikKPiA+ICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICBJZiAoKERlcmVmT2YgKFND
TEsgW1plcm9dKSAhPSBaZXJvKSkKPiA+ICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAg
ICBQQ1JPICgweERDLCAweDEwMEMsIERlcmVmT2YgKFNDTEsgW09uZV0pKQo+ID4gICAgICAgICAg
ICAgICAgIFNsZWVwICgweDEwKQo+ID4gICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAg
IEdQUFIgKFBJT0YsIFplcm8pCj4gPiAgICAgICAgICAgICBJZiAoKE9TWVMgIT0gMHgwN0Q5KSkK
PiA+ICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAgICBESVdLIChQSU9GKQo+ID4gICAg
ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgIFxfU0IuU0dPViAoMHgwMTAxMDAwNCwgWmVy
bykKPiA+ICAgICAgICAgICAgIFNsZWVwICgweDE0KQo+ID4gICAgICAgICAgICAgUmV0dXJuICha
ZXJvKQo+ID4gICAgICAgICB9Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
