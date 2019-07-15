Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26A69D2F
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 22:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F8F89B70;
	Mon, 15 Jul 2019 20:55:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8807189B70
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 20:55:49 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id j26so12357758vsn.10
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 13:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=17l6BarOh6lBvXjyBCn+gCk9YdJVKMA4r4cZBUPcTRA=;
 b=UsG4gZcKEfGpJKXEovjXbPLdz9E+OVH7XH3AONOf7WYYekzNcR1ot8RHhNgBBwUsZh
 H4bs8+AJQhgnHOSu6CLifQ9svqNSUPWfLrIeYJLXZU4K2GfnuiDoWZUn8DIYvRXR9MyI
 ruRAd/54CfDQszHBErI6Ka4c5pZ/tiE7svvmyhXMkWyMeSi9DFzQ9VIzMKtA/OhCYMim
 IakMYAJ1608Op75chzkRoIZ84ctEDkWbcfgN/fv5Zl/i3lCqJkL+vrIkJwcOZR8ACE73
 7SGRmxkgMCr0nRXWJT7Aob2hSx3qTZHIAIREMCNUNEag/F+JnEptB6qr61to6T8iWj3W
 PHNw==
X-Gm-Message-State: APjAAAV/Te5QAScimPIKn6V+noi3vbruvAHa6OHSuIv4K6WaqgdjmuBc
 XbsM1x5hfHUjGcN9HWUi4SUvFUcsbUfANTDQgwU=
X-Google-Smtp-Source: APXvYqzpstb/9dsIvAAOhRZ2JcfUgvwNRMssmrq4qefqyxaKXizvczzbCld4pVLekkPH2D2NeV9QCq3MAFYiMbtQKis=
X-Received: by 2002:a67:dd0d:: with SMTP id y13mr17215155vsj.210.1563224148593; 
 Mon, 15 Jul 2019 13:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MSTo-nX8MeHiGHveJ0GPO3okSEbKgzmcu_Z0J5w015T+e5qQ@mail.gmail.com>
In-Reply-To: <CA+MSTo-nX8MeHiGHveJ0GPO3okSEbKgzmcu_Z0J5w015T+e5qQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 15 Jul 2019 16:55:37 -0400
Message-ID: <CAKb7Uvg3nYz5xYmyqSeqtAWxbYDFA7jkxGaWDECWEeBdQrAzfA@mail.gmail.com>
To: Fernando Sahmkow <fsahmkow27@gmail.com>
Subject: Re: [Nouveau] Questions on Maxwell 2nd Gen Compute Kernels/Shaders
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMjozNCBQTSBGZXJuYW5kbyBTYWhta293IDxmc2FobWtv
dzI3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTbyB3ZSBoYXZlIGJlZW4gYnVzeSBpbXBsZW1lbnRp
bmcgdGhlIGNvbXB1dGUgZW5naW5lIGxhdGVseSBidXQgd2UgaGF2ZSBkaXNjb3ZlcmVkIGEgZmV3
IGlzc3VlcyB3aXRoIENvbXB1dGUgU2hhZGVycy4gSSBob3BlIHlvdSBndXlzIGNhbiBhbnN3ZXIg
c29tZSBxdWVzdGlvbnMuCj4KPiAxc3QgSG93IGRvIEkgZGV0ZXJtaW5lIHRoZSBzaXplIG9mIENv
bXB1dGUgU2hhZGVycy9LZXJuZWwgTG9jYWwgTWVtb3J5ID8gSW4gUGlwZWxpbmUgc2hhZGVycyB0
aGUgc2l6ZSBpcyBpbmNsdWRlZCBpbiB0aGUgaGVhZGVyIGJ1dCBDb21wdXRlIEtlcm5lbHMgZG9u
J3QgaGF2ZSBhIGhlYWRlciwgc28gaG93IGRvIEkgZGV0ZXJtaW5lIGhvdyBtdWNoIGxvY2FsIG1l
bW9yeSBpdCB1c2VzPyBJbiBjYXNlIEkgY2FuJ3QgaXMgdGhlcmUgYSBsaW1pdD8KCkZyb20gdGhl
IGhlYWRlciA6KQoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvdHJlZS9z
cmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvbnZjMC9udmU0X2NvbXB1dGUuaApodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS90cmVlL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91
dmVhdS9udmMwL252ZTRfY29tcHV0ZS5jI243NzUKCllvdSBtYXkgYWxzbyBmaW5kIHRoaXMgaW50
ZXJlc3Rpbmc6CgpodHRwczovL252aWRpYS5naXRodWIuaW8vb3Blbi1ncHUtZG9jL2NsYXNzZXMv
Y29tcHV0ZS8KClRoZXNlIGRvY3MgYXBwZWFyZWQgd2VsbCBhZnRlciB3ZSBoYWQgYWxyZWFkeSBS
RSdkLCBJIGRvbid0IHRoaW5rIHdlCmV2ZXIgd2VudCBiYWNrIHRvIGNoZWNrIGlmIHdlJ2QgbWlz
c2VkIGFueXRoaW5nIHN1YnN0YW50aWFsLgoKPgo+IDJuZCBJIGJhY2t0cmFjayBkaXJlY3Rpb25z
IGZvciBMREcgZnJvbSB0aGUgY29uc3RidWZmZXIgdGhhdCBzdG9yZXMgdGhlbS4gSSB0aGVuIHVz
ZSB0aGlzIGRpcmVjdGlvbnMgdGhlbiB0byBjb21wdXRlIHRoZSBhZHJlc3MgaW4gbXkgZW11bGF0
ZWQgU1NCTy4gRm9yIGZyYWdtZW50LCBnZW9tZXRyeSBhbmQgdmVydGV4IHNoYWRlcnMgSSBnb3Qg
bm8gcHJvYmxlbXMgd2l0aCB0aGlzIGRpcmVjdGlvbnMuIEZvciBjb21wdXRlIHNoYWRlcnMgdGhl
IGRpcmVjdGlvbnMgc2VlbSB0byBiZSBpbnZhbGlkLCBJIGltYWdpbmUgdGhlcmUncyBhIGJhc2Ug
YWRyZXNzIHRoYXQncyBhZGRlZCB0byB0aGlzIGRpcmVjdGlvbnMuIFdoZXJlIGNhbiBJIG9idGFp
biB0aGF0IGJhc2UgYWRyZXNzPwoKSSBkb24ndCB0aGluayBzby4gQ2FuIHlvdSBzaG93IG1lIGFu
IGluc3RydWN0aW9uIHN0cmVhbSB0aGF0IHN1Z2dlc3RzCnRoaXM/IEkgc3VzcGVjdCB5b3UncmUg
bWlzcmVhZGluZyB0aGUgY29kZS4gU2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5CmFzIGV2ZXJ5d2hl
cmUsIGV4Y2VwdCB0aGVyZSBhcmUgb25seSA4IGNvbnN0YnVmcyB0b3RhbCwgYW5kIHNvCnNvbWV0
aW1lcyB0aGUgYWN0dWFsIGNvbnN0YnVmIGRhdGEgaXMgYWxzbyByZXRyaWV2ZWQgd2l0aCBMREcu
Cgo+Cj4gM3JkIFNVQVRPTSBpbnN0cmFjdGlvbiBDQVMgaXMgc2ltaWxhciB0byBDb21wYXJlQW5k
U3dhcCBleGNlcHQgaXQgbWF5IGFkZCAxIG9yIDIgdG8gdGhlIGRhdGEgcmVnaXN0ZXIgb24gc3Rv
cmUuIEhvdyBkbyBJIGtub3cgd2hlbiBpdCBhZGRzIDEgb3IgMj8KClVobS4uLiBodWg/IENBUyA9
IGNvbXBhcmUgYW5kIHN3YXAuIFRoZSBhcmd1bWVudCBvcmRlciBpcyBkaWZmZXJlbnQKdGhhbiB0
aGUgb25lIGluIHRoZSBBUEksIGFzIEkgcmVjYWxsLCBidXQgdGhlcmUncyBubyBmdW5ueSBhZGRp
dGlvbgp0aGF0IEknbSBhd2FyZSBvZi4KCk5vdywgdGhlcmUgaXMgYSBJQURELlBPIG1vZGUgKFBP
ID0gcGx1cyBvbmUpLCB3aGljaCBjb3JyZXNwb25kcyB0bwpib3RoIGFyZ3VtZW50cycgbmVnIGJp
dHMgYmVpbmcgc2V0LCBidXQgdGhhdCdzIHRoZSBvbmx5IHN1Y2ggd2VpcmRuZXNzCkknbSBhd2Fy
ZSBvZi4KCkNoZWVycywKCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1
