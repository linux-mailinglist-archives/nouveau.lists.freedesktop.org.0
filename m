Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8732B7FE
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 14:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D2F6E3F4;
	Wed,  3 Mar 2021 13:25:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352DF6E3F4
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:25:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d15so8434519wrv.5
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cObvAg6Bn+6tmozMDd82mzSTMnR3UPYSthFc/gROqsg=;
 b=q2Pj0JR79eChvR1XMJvH9HLrCnAppIbMzeZMjClGx7l3UOckJ5YSXwS7bs3DcXsmrL
 cWA9PSiSnGs93ZOGOqBgAj8ma8JOxIZ8p5nuACT78zyLfjffFzvDWKgXmXD/t7aAhpCD
 C9t9lj55LMIVzV1oigog1kRKRU97ZVpENuohjFX7mk3fQp0t+qzs5lSaAG6A5RgTQOsb
 RtdR4nYWVfaePRGFXr+kIQ1ISmtlulbIbx+yzhlbE4qdJnzum4BJbWS05pyzWnZiQl2i
 oAUGo+RQ7k5PnI23wn1azTegzDcrTqnVZZeN2lRNcgNMXKQ4YDvhHEgUNfDZNhoMvj6d
 6s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cObvAg6Bn+6tmozMDd82mzSTMnR3UPYSthFc/gROqsg=;
 b=UpK28RaUT/CsCp1hj0GwovrDN2WU3adAPMkgSyswwg1QnBU/D2lV04ummwYdT7GOeG
 Ho9KXPtC0AuMVJ3blLL9ePzDarmXQ8dxshhEQJLZM51g0b01xSGoV9cE4vciASiuDKrx
 7cppeQz+Tn5JtQq3vbZutHW2b0ufDJjI3RdqNmuaxuzgGe4dU7PGeziVFGLL2xOvqIUR
 aVjQGp8Shx+b3RoIKDBYomPx+mFqK1WU+mYrVZsNjKeEF8ifGEbA+3/HOGP3fwsjuXAt
 V/rwW7QZ8gJQLL2ATGA+LhtDd52nvUpATYMIQBczN2aNE+HYIlfxkBfXVGxY3jKrUYte
 6LcA==
X-Gm-Message-State: AOAM530HtSN9zTROBPqWmGBzZnUe9fkKb9fD2+wgJtAOrifF1oWB1qsh
 E8/xJSCXCwNvg7NibVhGzNU=
X-Google-Smtp-Source: ABdhPJxuOL483LWO2Kz3MdXDjkSTDsUhC4FUmszVFBQU8XOfnwlTIRVjRt7f/t/356mUZbURSNFn4g==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr26802270wra.239.1614777937822; 
 Wed, 03 Mar 2021 05:25:37 -0800 (PST)
Received: from ?IPv6:2001:7c0:201d:13b:5605:dbff:fe76:161c?
 ([2001:7c0:201d:13b:5605:dbff:fe76:161c])
 by smtp.googlemail.com with ESMTPSA id c184sm4901948wmf.28.2021.03.03.05.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 05:25:37 -0800 (PST)
To: Ilia Mirkin <imirkin@alum.mit.edu>,
 Alex Riesen <alexander.riesen@cetitec.com>
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
 <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
Message-ID: <4cfd5800-1f3a-4740-244c-599601517cda@gmail.com>
Date: Wed, 3 Mar 2021 14:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Reply-To: uwe.sauter.de@gmail.com
Cc: nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMDMuMDMuMjEgdW0gMTQ6MTIgc2NocmllYiBJbGlhIE1pcmtpbjoKPiBPbiBXZWQsIE1hciAz
LCAyMDIxIGF0IDc6NDEgQU0gQWxleCBSaWVzZW4gPGFsZXhhbmRlci5yaWVzZW5AY2V0aXRlYy5j
b20+IHdyb3RlOgo+Pgo+PiBJbGlhIE1pcmtpbiwgU2F0LCBGZWIgMjcsIDIwMjEgMjI6MjY6NTcg
KzAxMDA6Cj4+PiBDYW4geW91IHRyeSBBbGV4J3MgcGF0Y2ggdG8gbW9kZXRlc3QgYW5kIGNvbmZp
cm0gdGhhdCB5b3Ugc2VlIGlzc3Vlcwo+Pj4gd2l0aCBtb2RldGVzdD8gSWYgc28sIGNhbiB5b3Ug
KGFuZCBtYXliZSBBbGV4IGFzIHdlbGwpIHRyeSBhbiBvbGRlcgo+Pj4ga2VybmVsIChJJ20gb24g
NS42KSBhbmQgc2VlIGlmIG1vZGV0ZXN0IGJlaGF2ZXMgd2VsbCB0aGVyZS4gW1RoZSBwYXRjaAo+
Pj4gaW4gcXVlc3Rpb24gd2FzIHRvIGV4cG9zZSAyNTZ4MjU2IGFzIHRoZSAncHJlZmVycmVkJyBz
aXplLCBidXQgc3VwcG9ydAo+Pj4gZm9yIHRoZSBsYXJnZXIgY3Vyc29ycyBoYXMgYmVlbiBhcm91
bmQgZm9yIGEgd2hpbGUuXSBBbGV4IC0gaWYgeW91Cj4+PiBoYXZlIHRpbWUsIHNhbWUgcXVlc3Rp
b24gdG8geW91Lgo+Pgo+PiBTb3JyeSB0aGF0IGl0IHRvb2sgc28gbG9uZy4gSSByZXRlc3RldCB3
aXRoIHRoZSBzYW1lIGtlcm5lbCBhcyBVd2UgZGlkCj4+ICg1LjQuMTAxKSBhbmQgbXkgcmVzdWx0
cyBhcmUgdGhlIHNhbWU6IG1vZGV0ZXN0IHdpdGggNjQgYW5kIDEyOCBjdXJzb3JzIGxvb2tzCj4+
IGdvb2QsIDI1NiBicm9rZW4uIERpZG4ndCB0ZXN0IHdpdGggWCB0aGlzIHRpbWUgKHRoaXMgYmVp
bmcgbXkgbWFpbiBvZmZpY2UKPj4gbWFjaGluZSksIGJ1dCBjYW4gZG8gbGF0ZXIgaWYgcmVxdWly
ZWQuCj4gCj4gVGhhbmtzIGZvciBjb25maXJtaW5nISBObyBuZWVkIHRvIHRlc3QgWCAtIHRoYXQg
d2lsbCB3b3JrIGZpbmUsIHNpbmNlCj4gd2Ugd2VyZSByZXBvcnRpbmcgdGhlIHNtYWxsZXIgY3Vy
c29ycyBvbiB0aGF0IGtlcm5lbC4KPiAKPiBTbyBJIHRoaW5rIHdlIGhhdmUgZGVmaW5pdGl2ZSBl
dmlkZW5jZSB0aGF0IGF0IGxlYXN0IGFsbCBLZXBsZXIKPiBkb2Vzbid0IGRvIDI1NngyNTYgKGFu
ZCBpdCdzIG5vdCBqdXN0IHNvbWUgYnVnIGluIHRoZSBkaXNwbGF5IG1hY3JvCj4gcmV3b3JrIHRo
YXQgZ290IGludHJvZHVjZWQpLiBBbmQgdW5sZXNzIEknbSBibGluZCBhbmQgZG9uJ3Qgc2VlIHRo
ZQo+IGNvcnJ1cHRpb24sIFBhc2NhbCBzZWVtcyBmaW5lLiBRdWVzdGlvbiByZW1haW5zIGZvciBN
YXh3ZWxsMS8yIEdQVXMuCj4gVW5sZXNzIHNvbWVvbmUgaGFzIGltbWVkaWF0ZSBwbGFucyB0byB0
ZXN0IG9uIHRob3NlLCBJJ2QgcmVjb21tZW5kCj4gYnVtcGluZyB0aGUgbWluaW11bSBmb3IgMjU2
eDI1NiBiZWluZyByZXBvcnRlZCB0byBQYXNjYWwsIGFuZCBkb2luZwo+IDEyOHgxMjggZm9yIEtl
cGxlciAvIE1heHdlbGwuCgpUaGUgb25seSBvbGRlciBtb2RlbCBJIGhhdmUgYWNjZXNzIHRvIHdv
dWxkIGJlIGEgNjYwMEdUIChOVjQzKS4gRG9uJ3Qga25vdyBpZiB0aGlzIHdvdWxkIGhhdmUgYW55
CnNpZ25pZmljYW5jZeKApgoKCVV3ZQoKCj4gU2ltb24sIEx5dWRlIC0tIHRob3VnaHRzPwo+IAo+
IENoZWVycywKPiAKPiAgIC1pbGlhCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
