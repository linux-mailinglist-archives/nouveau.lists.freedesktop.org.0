Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4220A413
	for <lists+nouveau@lfdr.de>; Thu, 25 Jun 2020 19:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AAC6EBF5;
	Thu, 25 Jun 2020 17:31:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143016EBF5
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 17:31:46 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id u8so3165904qvj.12
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=itEeZ1F/lzuGzui0eFbAV1XPt3YLhZ3c66RORb7DwP8=;
 b=k1ee41sapeBv+Ec64wWauXUcVjlspfk/nCpFrSmyjqHWPbZOpen3DKVuzSLpEZhorb
 SNyCh4Wrg6Li7Mt/bqu1d93/TQSYUh3V84XlhBqp/w1zTZahN5ITFnxgUvcpC9F0KKsL
 LJLFmCjXYwzNu7O8ELdzpKKbIPsGCZ1MYU32SbHbrX1nUnaAVkfpwwCoUiP4Y8xhI0RO
 JYs9DYZnyUXg8xBcNbdKvBllo8rf5989i+mk+UBsB5R9jOhaY+c5WTAbM23JoenxfNQt
 yR04iqXNABRySelA7WVrXzwrHeiPg4/kuV/aU7jWS6xs+3DNY2vJL+9oBZGwdHz29bOb
 VrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=itEeZ1F/lzuGzui0eFbAV1XPt3YLhZ3c66RORb7DwP8=;
 b=fIJskOpgonThN/XSdYqTlE+e8hAKCwnDDVKvVrHmPUdwTIbc21Ekb4Br/TYSnxecvG
 YOfEhsCzSzIlS4IdDo256xRLQMp9K1sQQgp22HoUwFM3vb6xIGxkPFy8D2VsQuYAcqxO
 pK2gkY5Yzp7+waIDSjpzY5+BtiEJkqdj7HQ/teAa+ZXKOlIhJtJJPhD0Co/epnUnalh0
 ZjVP4G654qTe2ivKiIbT52/BmuRKvcV2ar9semz8K9DP24eT0yH4QNvT7FjkpEHhpY7z
 OaHE9jhUuQZyoOqivjpiNfShHa2SbGkLTvcQRR+ks0AUE2AQGJV7R4gXpCiw0/kiugPe
 ixYQ==
X-Gm-Message-State: AOAM5338ZjNu4NUxezuyDRgXjFFfG+Vvu3c/5uz2HVQ56uUg61XcEEtR
 NXrQ9Jx509tgMFpCsqr6X7o9cw==
X-Google-Smtp-Source: ABdhPJzuxsX04dp6vqU3dYcnAf6eQ492YSoYAsmCgHr0gLh6r4gTcCO/Wqy1Q1zh7JC9jxZVWY0cXw==
X-Received: by 2002:ad4:4903:: with SMTP id bh3mr25904140qvb.17.1593106304974; 
 Thu, 25 Jun 2020 10:31:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id e9sm1659289qtq.70.2020.06.25.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 10:31:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1joViy-00EGdW-2a; Thu, 25 Jun 2020 14:31:44 -0300
Date: Thu, 25 Jun 2020 14:31:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200625173144.GT6578@ziepe.ca>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
 <20200624072355.GB18609@lst.de>
 <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
 <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
Subject: Re: [Nouveau] [RESEND PATCH 2/3] nouveau: fix mixed normal and
 device private page migration
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjUsIDIwMjAgYXQgMTA6MjU6MzhBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gTWFraW5nIHN1cmUgdG8gaW5jbHVkZSBsaW51eC1tbSBhbmQgQmhhcmF0YSBCIFJh
byBmb3IgSUJNJ3MKPiB1c2Ugb2YgbWlncmF0ZV92bWEqKCkuCj4gCj4gT24gNi8yNC8yMCAxMTox
MCBBTSwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4gPiAKPiA+IE9uIDYvMjQvMjAgMTI6MjMgQU0s
IENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAw
NDozODo1M1BNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiA+ID4gPiBUaGUgT3BlbkNM
IGZ1bmN0aW9uIGNsRW5xdWV1ZVNWTU1pZ3JhdGVNZW0oKSwgd2l0aG91dCBhbnkgZmxhZ3MsIHdp
bGwKPiA+ID4gPiBtaWdyYXRlIG1lbW9yeSBpbiB0aGUgZ2l2ZW4gYWRkcmVzcyByYW5nZSB0byBk
ZXZpY2UgcHJpdmF0ZSBtZW1vcnkuIFRoZQo+ID4gPiA+IHNvdXJjZSBwYWdlcyBtaWdodCBhbHJl
YWR5IGhhdmUgYmVlbiBtaWdyYXRlZCB0byBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkuCj4gPiA+ID4g
SW4gdGhhdCBjYXNlLCB0aGUgc291cmNlIHN0cnVjdCBwYWdlIGlzIG5vdCBjaGVja2VkIHRvIHNl
ZSBpZiBpdCBpcwo+ID4gPiA+IGEgZGV2aWNlIHByaXZhdGUgcGFnZSBhbmQgaW5jb3JyZWN0bHkg
Y29tcHV0ZXMgdGhlIEdQVSdzIHBoeXNpY2FsCj4gPiA+ID4gYWRkcmVzcyBvZiBsb2NhbCBtZW1v
cnkgbGVhZGluZyB0byBkYXRhIGNvcnJ1cHRpb24uCj4gPiA+ID4gRml4IHRoaXMgYnkgY2hlY2tp
bmcgdGhlIHNvdXJjZSBzdHJ1Y3QgcGFnZSBhbmQgY29tcHV0aW5nIHRoZSBjb3JyZWN0Cj4gPiA+
ID4gcGh5c2ljYWwgYWRkcmVzcy4KPiA+ID4gCj4gPiA+IEknbSByZWFsbHkgd29ycmllZCBhYm91
dCBhbGwgdGhpcyBkZWxpY2F0ZSBjb2RlIHRvIGZpeCB0aGUgbWl4ZWQKPiA+ID4gcmFuZ2VzLsKg
IENhbid0IHdlIG1ha2UgaXQgY2xlYXIgYXQgdGhlIG1pZ3JhdGVfdm1hXyogbGV2ZWwgaWYgd2Ug
d2FudAo+ID4gPiB0byBtaWdyYXRlIGZyb20gb3IgdHdvIGRldmljZSBwcml2YXRlIG1lbW9yeSwg
YW5kIHRoZW4gc2tpcCBhbGwgdGhlIHdvcmsKPiA+ID4gZm9yIHJlZ2lvbnMgb2YgbWVtb3J5IHRo
YXQgYWxyZWFkeSBhcmUgaW4gdGhlIHJpZ2h0IHBsYWNlP8KgIFRoaXMgbWlnaHQgYmUKPiA+ID4g
YSBsaXR0bGUgbW9yZSB3b3JrIGluaXRpYWxseSwgYnV0IEkgdGhpbmsgaXQgbGVhZHMgdG8gYSBt
dWNoIGJldHRlcgo+ID4gPiBBUEkuCj4gPiA+IAo+ID4gCj4gPiBUaGUgY3VycmVudCBjb2RlIGRv
ZXMgZW5jb2RlIHRoZSBkaXJlY3Rpb24gd2l0aCBzcmNfb3duZXIgIT0gTlVMTCBtZWFuaW5nCj4g
PiBkZXZpY2UgcHJpdmF0ZSB0byBzeXN0ZW0gbWVtb3J5IGFuZCBzcmNfb3duZXIgPT0gTlVMTCBt
ZWFuaW5nIHN5c3RlbQo+ID4gbWVtb3J5IHRvIGRldmljZSBwcml2YXRlIG1lbW9yeS4gVGhpcyBw
YXRjaCB3b3VsZCBvYnZpb3VzbHkgZGVmZWF0IHRoYXQKPiA+IHNvIHBlcmhhcHMgYSBmbGFnIGNv
dWxkIGJlIGFkZGVkIHRvIHRoZSBzdHJ1Y3QgbWlncmF0ZV92bWEgdG8gaW5kaWNhdGUgdGhlCj4g
PiBkaXJlY3Rpb24gYnV0IEknbSB1bmNsZWFyIGhvdyB0aGF0IG1ha2VzIHRoaW5ncyBsZXNzIGRl
bGljYXRlLgo+ID4gQ2FuIHlvdSBleHBhbmQgb24gd2hhdCB5b3UgYXJlIHdvcnJpZWQgYWJvdXQ/
Cj4gPiAKPiA+IFRoZSBpc3N1ZSB3aXRoIGludmFsaWRhdGlvbnMgbWlnaHQgYmUgYmV0dGVyIGFk
ZHJlc3NlZCBieSBsZXR0aW5nIHRoZSBkZXZpY2UKPiA+IGRyaXZlciBoYW5kbGUgZGV2aWNlIHBy
aXZhdGUgcGFnZSBUTEIgaW52YWxpZGF0aW9ucyB3aGVuIG1pZ3JhdGluZyB0bwo+ID4gc3lzdGVt
IG1lbW9yeSBhbmQgY2hhbmdpbmcgbWlncmF0ZV92bWFfc2V0dXAoKSB0byBvbmx5IGludmFsaWRh
dGUgQ1BVCj4gPiBUTEIgZW50cmllcyBmb3Igbm9ybWFsIHBhZ2VzIGJlaW5nIG1pZ3JhdGVkIHRv
IGRldmljZSBwcml2YXRlIG1lbW9yeS4KPiA+IElmIGEgcGFnZSBpc24ndCBtaWdyYXRpbmcsIGl0
IHNlZW1zIGluZWZmaWNpZW50IHRvIGludmFsaWRhdGUgdGhvc2UgVExCCj4gPiBlbnRyaWVzLgo+
ID4gCj4gPiBBbnkgb3RoZXIgc3VnZ2VzdGlvbnM/Cj4gCj4gQWZ0ZXIgYSBuaWdodCdzIHNsZWVw
LCBJIHRoaW5rIHRoaXMgbWlnaHQgd29yay4gV2hhdCBkbyBvdGhlcnMgdGhpbms/Cj4gCj4gMSkg
QWRkIGEgbmV3IE1NVV9OT1RJRllfTUlHUkFURSBlbnVtIHRvIG1tdV9ub3RpZmllcl9ldmVudC4K
PiAKPiAyKSBDaGFuZ2UgbWlncmF0ZV92bWFfY29sbGVjdCgpIHRvIHVzZSB0aGUgbmV3IE1NVV9O
T1RJRllfTUlHUkFURSBldmVudCB0eXBlLgo+Cj4gMykgTW9kaWZ5IG5vdXZlYXVfc3ZtbV9pbnZh
bGlkYXRlX3JhbmdlX3N0YXJ0KCkgdG8gc2ltcGx5IHJldHVybiAobm8gaW52YWxpZGF0aW9ucykK
PiBmb3IgTU1VX05PVElGWV9NSUdSQVRFIG1tdSBub3RpZmllciBjYWxsYmFja3MuCgpJc24ndCBp
dCBhIGJpdCBvZiBhbiBhc3N1bXB0aW9uIHRoYXQgbWlncmF0ZV92bWFfY29sbGVjdCgpIGlzIG9u
bHkKdXNlZCBieSBub3V2ZWF1IGl0c2VsZj8KCldoYXQgaWYgc29tZSBvdGhlciBkZXZpY2VzJyBk
ZXZpY2VfcHJpdmF0ZSBwYWdlcyBhcmUgYmVpbmcgbWlncmF0ZWQ/CgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
