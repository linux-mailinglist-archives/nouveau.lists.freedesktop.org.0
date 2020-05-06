Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE01C799F
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 20:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5D6E8C5;
	Wed,  6 May 2020 18:45:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A5B6E8C8
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 18:45:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id q13so2399122qtp.7
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Xp4PtIWSbFjNlCqFouJe0yrPGUY2LlWC8culMqw4W34=;
 b=R7lsSWur/AS2+mWO7IfggMu+O6gDIpHb5fsBvc2LXsH3PmDGNjMK0zpysOcb4Eb+cz
 mf1+TNibVmiOreGgMt3vNl0KRwbfkShNrsiJbn/DxYcbSmXH5gNZ2gXIH9fCOUIYt2rx
 uufl1oq3YEnO5fNw5YpjjaxL6Z++oij1nCST3wT/cti8pRbhvx/M4SzbZD4RgxRFb8j/
 a+zbity4CLj+uAm+lxJ1UlFhn4tfneJczLNr2kYjP8d52NCpunCB2utDdguPKw1NtyIw
 xRCnoJJk0pa86wmw4nQiE5mnB14UQ13vcfrECf72UWGBC29459PJrqkAuJYkcOi1aUv5
 XJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Xp4PtIWSbFjNlCqFouJe0yrPGUY2LlWC8culMqw4W34=;
 b=tV9hbndtyQ+j+xMdgrBk5QjcNnUhaUwmCNd/XGb0+AhWlYoCtNrFSWWrQGl2nzDTTL
 oJEjpaXk5MiiUxq+/nFXaMX8mSjB9dZXV+l7ufEmE7gnp6JhgqxA0Y2U3UX+/1nD8Tns
 ahFa1crIyCFanV1Ak2cbWHPSSTcUbWMYjhD41EDq6dl8bo++R4SJ+4wwfm14S4C9zn8x
 Dk86OITp6RtOM7cvSO6YoCjW2dDnF+5gKRMcOWig8dyc7vVmc8mHULe3143/fgPKNFKN
 hwcfrPx1boV0hzMzlYb3kdYOgmUfqxOJASyMHokJxWjUhGpzO1DqRoZLIUgRkxryJQXy
 ZfIg==
X-Gm-Message-State: AGi0PuaID0mgiLW6iuZNvPgjqs0Wxdow1a7xgDhk+RDmYNFeMQrA1nCf
 VTTPcsPEFw/hqfigPkWoI8vCsA==
X-Google-Smtp-Source: APiQypL616xxVLy7sIJ2gUjjzq8FfTN3eeP1TOOdrppMGZHDTaCWu7Efs5+lgJDGx3ZLUW9Bw/3rtw==
X-Received: by 2002:ac8:4d06:: with SMTP id w6mr9559957qtv.180.1588790727109; 
 Wed, 06 May 2020 11:45:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x5sm715097qtx.35.2020.05.06.11.45.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 May 2020 11:45:26 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jWP2s-0002GJ-3V; Wed, 06 May 2020 15:45:26 -0300
Date: Wed, 6 May 2020 15:45:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200506184526.GA8668@ziepe.ca>
References: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH hmm v2 0/5] Adjust hmm_range_fault() API
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDEsIDIwMjAgYXQgMDM6MjA6NDNQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBU
aGUgQVBJIGlzIGEgYml0IGNvbXBsaWNhdGVkIGZvciB0aGUgdXNlcyB3ZSBhY3R1YWxseSBoYXZl
LCBhbmQKPiBkaXN1Y3NzaW9ucyBmb3Igc2ltcGxpZnlpbmcgaGF2ZSBjb21lIHVwIGEgbnVtYmVy
IG9mIHRpbWVzLgo+IAo+IFRoaXMgc21hbGwgc2VyaWVzIHJlbW92ZXMgdGhlIGN1c3RvbWl6YWJs
ZSBwZm4gZm9ybWF0IGFuZCBzaW1wbGlmaWVzIHRoZQo+IHJldHVybiBjb2RlIG9mIGhtbV9yYW5n
ZV9mYXVsdCgpCj4gCj4gQWxsIHRoZSBkcml2ZXJzIGFyZSBhZGp1c3RlZCB0byBwcm9jZXNzIGlu
IHRoZSBzaW1wbGlmaWVkIGZvcm1hdC4KPiBJIHdvdWxkIGFwcHJlY2lhdGVkIHRlc3RlZC1ieSdz
IGZvciB0aGUgdHdvIGRyaXZlcnMsIHRoYW5rcyEKPiAKPiB2MjoKPiAgLSBNb3ZlIGNhbGwgY2hh
aW4gdG8gY29tbWl0IG1lc3NhZ2UKPiAgLSBGaXggdHlwbyBvZiBITU1fUEZOX1JFUV9GQVVMVAo+
ICAtIE1vdmUgbm91dmVhdV9obW1fY29udmVydF9wZm4oKSB0byBub3V2ZWF1X3N2bS5jCj4gIC0g
QWRkIGFja3MgYW5kIHRlc3RlZC1ieXMKPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8w
LXYxLTRlYjcyNjg2ZGUzYys1MDYyLWhtbV9ub19mbGFnc19qZ2dAbWVsbGFub3guY29tCj4gCj4g
Q2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBKb2huIEh1YmJhcmQgPGpo
dWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gVG86IFJhbHBoIENh
bXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3
YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6ICJEYXZpZCAoQ2h1bk1p
bmcpIFpob3UiIDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogIllhbmcsIFBoaWxpcCIgPFBoaWxpcC5Z
YW5nQGFtZC5jb20+Cj4gVG86IGxpbnV4LW1tQGt2YWNrLm9yZwo+IAo+IEphc29uIEd1bnRob3Jw
ZSAoNSk6Cj4gICBtbS9obW06IG1ha2UgQ09ORklHX0RFVklDRV9QUklWQVRFIGludG8gYSBzZWxl
Y3QKPiAgIG1tL2htbTogbWFrZSBobW1fcmFuZ2VfZmF1bHQgcmV0dXJuIDAgb3IgLTEKPiAgIGRy
bS9hbWRncHU6IHJlbW92ZSBkZWFkIGNvZGUgYWZ0ZXIgaG1tX3JhbmdlX2ZhdWx0KCkKPiAgIG1t
L2htbTogcmVtb3ZlIEhNTV9QRk5fU1BFQ0lBTAo+ICAgbW0vaG1tOiByZW1vdmUgdGhlIGN1c3Rv
bWl6YWJsZSBwZm4gZm9ybWF0IGZyb20gaG1tX3JhbmdlX2ZhdWx0CgpBcHBsaWVkIHRvIGhtbS5n
aXQsIHRoYW5rcwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
