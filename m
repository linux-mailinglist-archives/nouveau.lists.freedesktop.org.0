Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE763D3F
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2019 23:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B71898E1;
	Tue,  9 Jul 2019 21:24:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62189856
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2019 21:24:41 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id j26so81966vsn.10
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2019 14:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MAYkiYDKMmHfgFIyDNV0R29pplX9tpJ7Bb6na1+fCBA=;
 b=FO6XiOO8y8CMGYj058LUunZlG+xqo04m9NvIiMq0G0ExOL0UkbEtHibH7E0N+KOI8C
 1Z6WHCQYiwQefuj+vueQMoHY2nvLrr2k+hmoM5UMNegqYJbXzKEdRUoyvck8BsMGGNKO
 QZw+3u3jaJ459i4z71ZrrLYTtKM0uS+JJgcY/NUgf8vwAJ5nx0zvCK84kouBQ0qG2wve
 XGlgDjF/7Hfq+Ikk2nzIrB1a3f8JGeu2UFiLw5LkyH24gH4hRrJbjDGPTm52CyuS6p/P
 z0oQjONBrlMfJZMgdnwuiTf34lsG1jmcWawm4gFkDjhgU47ydsOLzSwaspMZYFRRrxeB
 xuqw==
X-Gm-Message-State: APjAAAVqsyeksNhc/VruMsUcvd+JHWULpdWRE6noEafWWZ4iCwKZy1lZ
 B7mL8WZLgIh4vNlF4onkUk01hvLYKKBrKvvMJPg=
X-Google-Smtp-Source: APXvYqxthOre4akrllS2lRflURAs7nHworeDZESGKbJT782HxNDhYPyXErqEoPzS1cMxKhCnsh1/xU+f9Nns+GiXpSk=
X-Received: by 2002:a67:fb02:: with SMTP id d2mr15761376vsr.207.1562707480971; 
 Tue, 09 Jul 2019 14:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MSTo-k37qmJ1zZbUECm2HpuhZmSZoOxtypbkT2y8=q-x1vtw@mail.gmail.com>
In-Reply-To: <CA+MSTo-k37qmJ1zZbUECm2HpuhZmSZoOxtypbkT2y8=q-x1vtw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 9 Jul 2019 17:24:30 -0400
Message-ID: <CAKb7Uvi1NUNRZAbhy3bbD4qRaM+_qm4-dkNWX3HNbjGw-97f+A@mail.gmail.com>
To: Fernando Sahmkow <fsahmkow27@gmail.com>
Subject: Re: [Nouveau] Questions on Falcon Command Processor
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

SSBiZWxpZXZlIHRoYXQgTlZEZWMgaXMgc2ltaWxhciB0byB0aGUgTVNERUMgZW5naW5lcyAoQlNQ
LCBWUCwgYW5kClBQUCkgb24gS2VwbGVyIEdQVXMuIFlvdSBjYW4gc2VlIHRoZSBkZXRhaWxzIG9m
IHRoZSB2YXJpb3VzIGJpdHMgYmVpbmcKc3VibWl0dGVkIGhlcmU6CgpodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL21lc2EvbWVzYS90cmVlL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9u
b3V2ZWF1X3ZwM192aWRlby5oCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNh
L3RyZWUvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L25vdXZlYXVfdnAzX3ZpZGVvX2JzcC5j
Cmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL3RyZWUvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ub3V2ZWF1L25vdXZlYXVfdnAzX3ZpZGVvX3ZwLmMKCmFuZCBzb21lIHJlbGF0ZWQg
Y29kZS4gSSBoYXZlbid0IGludmVzdGlnYXRlZCB0aGUgcHJlY2lzZSBkZXRhaWxzIG9mCk5WRGVj
IHlldCwgYnV0IHJ1bW9ycyBzdWdnZXN0IGl0IHNob3VsZCBiZSBzaW1pbGFyLCBldmVuIHRob3Vn
aCBpdCdzIGEKc2luZ2xlIGVuZ2luZSBub3cgcmF0aGVyIHRoYW4gbWFueS4gWW91J2xsIGhhdmUg
dG8gZG8gc29tZSBzbmlmZmluZy4KCkNoZWVycywKCiAgLWlsaWEKCk9uIFR1ZSwgSnVsIDksIDIw
MTkgYXQgNDozNiBQTSBGZXJuYW5kbyBTYWhta293IDxmc2FobWtvdzI3QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPiBTbyBub3cgSSdtIHRvIGxvb2tpbmcgdG8gaW1wbGVtZW50IE5WRGVjIGFuZCBhcyBm
YXIgYXMgSSBrbm93IHRoZSBnYW1lIHN1Ym1pdHMgYSBzZXJpZXMgb2YgY29tbWFuZHMgdG8gdGhl
IHNlcnZpY2UuIFRoaXMgY29tbWFuZHMgYXJlIHByb2Nlc3NlZCBieSBGYWxjb24gYW5kIHRoZW4g
aXQgZG9lcyBpdHMgbWFnaWMuIERvIHlvdSBndXlzIGdvdCBhbnkgUkUgb24gRmFsY29uIGNvbW1h
bmRzIGFuZCBob3cgdGhleSBleGVjdXRlIGRpZmZlcmVudCB3b3JrbG9hZHMgPwo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5n
IGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
