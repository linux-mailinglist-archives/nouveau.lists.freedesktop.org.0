Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5531AFBDD
	for <lists+nouveau@lfdr.de>; Sun, 19 Apr 2020 18:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48CF6E043;
	Sun, 19 Apr 2020 16:11:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93AD6E043
 for <nouveau@lists.freedesktop.org>; Sun, 19 Apr 2020 16:11:24 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id s5so2670926uad.4
 for <nouveau@lists.freedesktop.org>; Sun, 19 Apr 2020 09:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEbkKST45yDKLeqwj4k2+WYW5wB6CepGS+o4LeJbJi4=;
 b=C9tvML+F2CVpB2/Pah/ROYN/Lm/ELDEZ+DMozw/YKx9xzYz5ahyyoEPJZb9yLvR8kT
 Cd8FI5smYzEHDAFZ5xTwI2lS/jQLdatUaET38GdjJmGoGVArzDsyEShFJZxiJ7NOu3Ks
 1Y3ZpWvnGELoGCWBaKBW+ab3WOFkczrnuOyASIbEw3+6q/ZOPV0LuQIjLpR2tjnwB7vk
 iL5W3J6w5n6M8xcwZL7ruxMsizMJJHgOnt3DCSu5uR87shJmI324yEknYySThEvWYwzn
 KjAeogWXijtlfL6E721M+U4eAwIyIJxs/2m/rUZpZlJQX5u2qT89NadJqIp5k1+F20NI
 RDGw==
X-Gm-Message-State: AGi0PubgW1TRkWz698xI+ZkEJiQZP2ixM4Be/LWYky+eKBFT1VKWRf/W
 aXQyvgNd5nst/uXpzhyKE98bb7snvJFHfDfnGNQ=
X-Google-Smtp-Source: APiQypKYhwdIBlILe0Ne8bJ6FUkUqoDaK5KePM1YbnyETe9FaU2YwVrK093WR07FOt/cqWYgqUovfGiuvsEQl3Rm5To=
X-Received: by 2002:ab0:406a:: with SMTP id h97mr5033608uad.98.1587312683930; 
 Sun, 19 Apr 2020 09:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <9CF7997B-7987-4444-85BF-2FB3AC0E030F@gmail.com>
In-Reply-To: <9CF7997B-7987-4444-85BF-2FB3AC0E030F@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 19 Apr 2020 12:11:12 -0400
Message-ID: <CAKb7Uvh6i2566_N71wSvvLerggD-AkV2AogbnS2kX8mp+8uYXA@mail.gmail.com>
To: Christian Calderon <calderonchristian73@gmail.com>
Subject: Re: [Nouveau] Error -28
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RG9lcyBpdCBwcmludCBhbnl0aGluZyBlbHNlIGJlZm9yZSB0aGF0PwoKVGhlcmUncyBkZWZpbml0
ZWx5IHNvbWUgZHViaW91cyBlbmRpYW4tdW5zYWZlIGNvZGUgaW4gdGhlIGxhdGVyCm5vdXZlYXUg
c3R1ZmYuIEZvciBleGFtcGxlLCBudmttX2ZhbGNvbl92MV9yZWFkX2RtZW0gc2VlbXMgdG8gbWFr
ZQphc3N1bXB0aW9ucyBhYm91dCBDUFUgYmVpbmcgTEUsIGJhc2VkIG9uIGEgcXVpY2sgcmVhZCBv
ZiB0aGUgY29kZSwgYW5kCkkgd291bGQgZXhwZWN0IHRoZSBmaWxlIGhlYWRlciBwYXJzaW5nIHN0
dWZmIGRvZXMgdG9vLgoKQ2hlZXJzLAoKICAtaWxpYQoKT24gU3VuLCBBcHIgMTksIDIwMjAgYXQg
Mzo0NCBBTSBDaHJpc3RpYW4gQ2FsZGVyb24KPGNhbGRlcm9uY2hyaXN0aWFuNzNAZ21haWwuY29t
PiB3cm90ZToKPgo+IEnigJltIGhhdmluZyB0cm91YmxlIGdldHRpbmcgbXkgR1RYIDEwNTAgVGkg
d29ya2luZyBpbiBEZWJpYW4gU2lkLiBUaGlzIG1hY2hpbmUgaXMgYSBQb3dlck1hYyBHNSwgMi4z
IEdIeiBEdWFsIENvcmUuIEnigJltIHVzaW5nIGEgUXVhZHJvIEZYIDQ1MDAgYXMgd2VsbCBhbmQg
aXQgc2VlbXMgdG8gd29yayBhcyBleHBlY3RlZC4gSeKAmXZlIGluc3RhbGxlZCB0aGUgZmlybXdh
cmUtbGludXgtbm9uZnJlZSBwYWNrYWdlLCB3aGljaCBzZWVtcyB0byBoYXZlIHRoZSByZXF1aXJl
ZCBmaXJtd2FyZSBmb3IgdGhlIEdUWCAxMDUwIFRpLiBJbiBkbWVzZyBJIHNlZSB0aGlzIGVycm9y
IGFmdGVyIHNvbWUgbGluZXMgd2hpY2ggbWVudGlvbiDigJxkaXJlY3QtbG9hZGluZyBmaXJtd2Fy
ZeKAnToKPgo+ICAgICBub3V2ZWF1IDAwMDE6MDY6MDAuMDogZ3IgY3RvciBmYWlsZWQsIC0yOAo+
Cj4gQW55IGlkZWFzIG9uIGhvdyB0byBmaXggdGhpcz8KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
