Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172777AD6
	for <lists+nouveau@lfdr.de>; Sat, 27 Jul 2019 19:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2D6EEC9;
	Sat, 27 Jul 2019 17:47:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E946EEC9
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 17:47:03 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id v18so22459983uad.12
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 10:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gSmRdLTHkNJxBYkB4ZjVSGJrxbXdmO8hMvZuoIFVxVo=;
 b=gLWIUtCviJpJmn/HeP1L6lXmhMPOZvqjsaMdHx7PGSIDPlqbz8cGFutoqpExUCI5Hl
 gGUuJu+whlh3PA0vBpBdKnv4pjqaChZhHlhXyKWpY31AOQX/XvP2KqBfOlJDPFa1DfvF
 +VHjkdII0T/QXbEtyTq2Ed2IVy/tKQN0+Cjaxp2Q1+YsDiPOfH7RqPvBsO8+uiFNpIxE
 Of9fdRfYVIZRFBhqWvCMaSTBzaQKLkXaMqPhfnx/fsaS+RLUujVjAsMkQZso1ZO3yD5J
 Ux2t/iucM2AEFpqSkIVKxe84dQKKV2kJNvB7QC3Tu3BD/7dlr/3CaYH3BunBgHqCZMjH
 qTOw==
X-Gm-Message-State: APjAAAVFH35yTZySA7YL8bWXRVU69l50njGttwxEDQ0j2IOlWXEwVDJ3
 1eu0oy30j8Est1LvwJbFYxrm1AOSyFoQTaCk1AU=
X-Google-Smtp-Source: APXvYqxzVZs1LpucrAHI5bTe5YvcqPSRj47Cpo3AWVvBq6n+J36PFwqzQg4zLEapPtXpcAzRSToduZevNstO0JlLUas=
X-Received: by 2002:ab0:470e:: with SMTP id h14mr38731565uac.98.1564249622661; 
 Sat, 27 Jul 2019 10:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
In-Reply-To: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 27 Jul 2019 13:46:51 -0400
Message-ID: <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
To: Ralph Corderoy <ralph@inputplus.co.uk>
Subject: Re: [Nouveau] Video Hardware Decoding: Jittery Rectangles on Nvidia
 GT218 NVA8 VP4.
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

T24gU2F0LCBKdWwgMjcsIDIwMTkgYXQgNzozNyBBTSBSYWxwaCBDb3JkZXJveSA8cmFscGhAaW5w
dXRwbHVzLmNvLnVrPiB3cm90ZToKPiBUaGUgdmlkZW8gcGxheXMsIENQVSBsb2FkIGlzIGxlc3Mg
KG15IGFpbSksIGJ1dCB0aGVyZSdzIOKAmHRlYXJpbmfigJkgb2YgdGhlCj4gcGljdHVyZSBhcyBp
ZiBzbWFsbCByZWN0YW5nbGVzIHRoYXQgYXJlIHVwZGF0ZXMgYXJlIGFwcGVhcmluZyBpbiB0aGUK
PiB3cm9uZyBsb2NhdGlvbiwgb2ZmIGJ5IGEgbGl0dGxlLiAgSWYgSSBzdGVwIHRocm91Z2ggdGhl
IGZyYW1lcyB3aXRoCj4gbXB2J3Mg4oCYLuKAmSBhbmQg4oCYLOKAmSB0aGVuIEkndmUgZm91bmQg
YSBwYXR0ZXJuOiBvbmUgZnJhbWUncyBwaWN0dXJlIGlzCj4gZ29vZCwgZm9sbG93ZWQgYnkgTiBi
YWQgb25lcyB3aGVyZSBOIGlzIDMgb3IgNywgaS5lLiBldmVyeSA0dGggb3IgOHRoCj4gZnJhbWUg
aXMgb2theS4gIERvbid0IGtub3cgaWYgdGhhdCdzIGEgY2x1ZSBvciBoZWxwcyBzb21lb25lIGhl
cmUKPiByZWNvZ25pc2UgYSBrbm93biBwcm9ibGVtLgo+Cj4gSSBrbm93IFggd2VsbCwgYnV0IE1l
c2EsIGV0Yy4sIGJlbG93IGl0IGFyZSB1bmtub3duIHRvIG1lLCBldmVuIHRvIHRoZQo+IGV4dGVu
dCBvZiBrbm93aW5nIHF1aXRlIGhvdyBhbGwgdGhlIGJpdHMgZml0IHRvZ2V0aGVyLiAgSSdkIGFw
cHJlY2lhdGUgYQo+IHBvaW50ZXIgb3IgdHdvIGFzIHRvIGhvdyB0byB0YWNrbGUgdGhlIHByb2Js
ZW0sIGV2ZW4gaWYgaXQncyBhIOKAmFlvdSd2ZQo+IGNvbWUgdG8gdGhlIHdyb25nIHBsYWNlLCBn
byBvdmVyIHRoZXJl4oCZLiAgOi0pCgpVbmZvcnR1bmF0ZWx5IEkndmUgbmV2ZXIgdHJhY2tlZCBk
b3duIHRoZSBjYXVzZSBmb3IgdGhpcy4KaHR0cHM6Ly9ub3V2ZWF1LmZyZWVkZXNrdG9wLm9yZy93
aWtpL1ZpZGVvQWNjZWxlcmF0aW9uLyAtIHNlZSBub3RlICM0LgoKSSBoYXZlLCBvdmVyIHRpbWUs
IGNvbGxlY3RlZCBzb21lIHNhbXBsZSB2aWRlb3Mgd2hlcmUgdGhpcyBoYXBwZW5zIGluCnRoZSBm
aXJzdCBmZXcgZnJhbWVzLiBUaGUgcGxhbiB3YXMgdG8gZG8gbW10IHRyYWNlcyBvZiB0aGUgYmxv
Ygpkcml2ZXIsIGFuZCBmaWd1cmUgb3V0IHdoYXQgaXQgd2FzIGRvaW5nIGRpZmZlcmVudGx5LiBJ
ZiB0aGlzIGlzCnNvbWV0aGluZyB5b3UncmUgaW50ZXJlc3RlZCBpbiwgSSdkIGJlIGhhcHB5IHRv
IHByb3ZpZGUgc29tZSBndWlkYW5jZS4KSG93ZXZlciBteSBwYXN0IGVmZm9ydHMgdG8gd29yayB0
aGlzIG91dCB3ZXJlIGZydWl0bGVzcy4gSG9wZWZ1bGx5Cml0J3MganVzdCBzb21ldGhpbmcgZHVt
YiB3ZSdyZSBkb2luZyBpbiByZWZlcmVuY2UgZnJhbWUgbWFuYWdlbWVudCwgb3IKYSBtaXNzaW5n
IGJpdCBpbiB0aGUgaW5mbyBzdHJ1Y3R1cmVzLCBvciBzb21ldGhpbmcgZWxzZSBlbnRpcmVseSBz
aW5jZQpJJ3ZlIHNjb3VyZWQgcXVpdGUgaGVhdmlseSBmb3IgdGhvc2UgdHdvLgoKSWYgeW91J2Qg
bGlrZSB0byBkZWRpY2F0ZSBzb21lIG9mIHlvdXIgdGltZSB0byB3b3JraW5nIHRoaXMgb3V0LCB5
b3UKY2FuIGpvaW4gdXMgYXQgI25vdXZlYXUgb24gZnJlZW5vZGUuCgpDaGVlcnMsCgogIC1pbGlh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
