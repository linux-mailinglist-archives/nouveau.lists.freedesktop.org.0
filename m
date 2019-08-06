Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDD837F2
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 19:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8F66E4F8;
	Tue,  6 Aug 2019 17:36:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4B86E4F8
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 17:36:05 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 130so17527313vkn.9
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 10:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvNctwMBIz7409Cp7iuoNkcwYmvKFsDFidYtiLWS9Tk=;
 b=LjjdL1e5rVMEnO6FOCXiu9V9aavyoeVwk4eLsrECm8o65oefjwvmpJRYYWRC0LYdS/
 SukDDaEzy4eWKHkRHcmjWjBhXoiYboGwnjz5mYzbqsZI07+uCIDLgocxUQtOT/Uvu1Jk
 SBGKx2ed1aDWYhXF4fkQcxgOKMU25ROJ7v1ZnLLUbz6+qj7F9rLfrBHVMq73Dxph6VXq
 cnfa4PZpjsOdJKW0WaPqTLgJ+xYxo5sn9h3MZIoV4q07zjzl2prdEJl1sF5yGrrPqZ08
 m4Hyw0XEWrCufy9bphqJcTts4gXANdEVYepTIFZGT9wzrWCfBPl1/ksgOCJsUcxUTaiv
 SXmA==
X-Gm-Message-State: APjAAAXBNs8M4Q8yuZxCPpXFyWiHZ/OsTcHJtJeHK0GSlx0R4IbEfV0g
 lFDQi523XzkgaMLiM2jKwTMLj1FirFRkuV7zHhF+3g==
X-Google-Smtp-Source: APXvYqzzYsrW4r/6ubX+B9cnrg6u2BAK/TFqiuydRPz51kozTwYJBl1hPxQK+nXt1PBA8REF5WmGCgwwZPzr8weWkQI=
X-Received: by 2002:a1f:2fca:: with SMTP id v193mr1795791vkv.14.1565112964899; 
 Tue, 06 Aug 2019 10:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <qic915$1j2$1@blaine.gmane.org>
 <CAKb7Uvg-7UVzYJXy3YBpV038yfsZx2hx-LZ7omR9HnCiZwYmXA@mail.gmail.com>
 <qicbpr$6q56$1@blaine.gmane.org> <qicci7$9ci$1@blaine.gmane.org>
In-Reply-To: <qicci7$9ci$1@blaine.gmane.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 6 Aug 2019 13:35:53 -0400
Message-ID: <CAKb7Uvgnegj15BMoUoH9UT1oP6e4+KHxUShwpMTnu1U5xOu9_A@mail.gmail.com>
To: James <bjlockie@lockie.ca>
Subject: Re: [Nouveau] unstable refresh rate
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

Q2FuIHlvdSB0cnkgc29tZXRoaW5nIHZlcnkgc2ltcGxlIC0gdW5wbHVnIHRoZSBjYWJsZSwgYW5k
IHBsdWcgaXQgYmFjawppbiwgd2hpbGUgdGhlIFRWIGlzIG9uLCBhbmQgc2V0IHRvIHRoZSBIRE1J
IGlucHV0PyBUaGF0IHNob3VsZCBlbnN1cmUKdGhhdCB0aGUgU0NEQyB3cml0ZSBjYW4gZ28gdGhy
b3VnaCBhdCBtb2Rlc2V0IHRpbWUuCgpZb3UgY2FuIGFsc28gZm9yY2Ugbm91dmVhdSB0byBhdm9p
ZCBhbnkgbW9kZXMgdGhhdCByZXF1aXJlIHNjcmFtYmxpbmcKYnkgYm9vdGluZyB3aXRoIG5vdXZl
YXUuaGRtaW1oej0zNDAuCgpDaGVlcnMsCgogIC1pbGlhCgpPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0
IDE6MTUgUE0gSmFtZXMgPGJqbG9ja2llQGxvY2tpZS5jYT4gd3JvdGU6Cj4KPiBJIHdhcyBnb2lu
ZyB0byBidXkgYSBuZXcgY2FibGUgYW5kIEkgY2FtZSBhY3Jvc3MgdGhpcyBkZXNjcmlwdGlvbjoK
PiAgPkNhdGVnb3J5IDIgQ2VydGlmaWVkIEhETUkgd2lyZSBzdXBwb3J0cyByZXNvbHV0aW9ucyB1
cCB0byA0S3gySyAoVUhEKQo+IEAzMCBIego+Cj4gaHR0cHM6Ly93d3cuY25ldC5jb20vaG93LXRv
L3doYXQtaXMtaGRtaS0yLTBiLwo+ID4gSERNSSB2ZXJzaW9ucyBjb21wYXJlZAo+ID4gSERNSSBW
ZXJzaW9uICBNYXggUmVzb2x1dGlvbiAgTWF4IDRLIEZyYW1lIHJhdGUgICAgICAgSERDUCAyLjIg
ICAgICAgIEhEUiAgICAgV0NHICAgICBIeWJyaWQgTG9nIEdhbW1hICAgICAgICBEeW5hbWljIE1l
dGFkYXRhCj4gPiAxLjQgICA0SyAgICAgIDMwSHogICAgTm8gICAgICBObyAgICAgIE5vICAgICAg
Tm8gICAgICBObwo+ID4gMi4wICAgNEsgICAgICA2MEh6ICAgIFllcyAgICAgTm8gICAgICBObyAg
ICAgIE5vICAgICAgTm8KPiA+IDIuMGEgIDRLICAgICAgNjBIeiAgICBZZXMgICAgIFllcyAgICAg
WWVzICAgICBObyAgICAgIE5vCj4gPiAyLjBiICA0SyAgICAgIDYwSHogICAgWWVzICAgICBZZXMg
ICAgIFllcyAgICAgWWVzICAgICBObwo+ID4gMi4xICAgMTBLICAgICAxMjBIeiAgIFllcyAgICAg
WWVzICAgICBZZXMgICAgIFllcyAgICAgWWVzCj4KPiAiQ2F0ZWdvcnkgMiIgaW1wbGllcyBIRE1J
IDIgYnV0IHRoZSAiTWF4IDRLIEZyYW1lIHJhdGUiIG9mIDMwSHogc2F5cyBpdAo+IGlzIEhETUkt
MS40Lgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
