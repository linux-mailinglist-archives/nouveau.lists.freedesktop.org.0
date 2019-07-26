Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AA771DE
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2019 21:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551136EE39;
	Fri, 26 Jul 2019 19:09:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE796EE39
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2019 19:08:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s145so39842576qke.7
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2019 12:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Qb1+vbELQhwoE9sQvpjeKsKKHLnCMT4wIYjW7XVS9cM=;
 b=hvXaKjQk64Deth8K+f8EcMD9+BR+rfLsQcf3YGwsrPg6O3LFQTFXT5lSkqKcp0WYNc
 pbrJ6ILumFQY6FT0DH+ZiV/agRN6e7+LMZ7uMC/RDGk3ivhCP9xcd+DGoix8MAramNrC
 hYHUDLDjePfjx5qsXGw4KXWr2Cexvbw+pdWa62nnAPg0X9YznOVQSdjk15T/ov9j/i+s
 64DSiIqmo8ItKYNanNFjHE5OzdphMtdgllXr+QFQbHfs1g3zIOhzhsV8IHzRCkVZJUp2
 V6lJeqGDCzxYTktjbrljgOa9IULlZUxerRc5LZdRTRgJf94dNnOysSB/0BPCKodYjie7
 +yiQ==
X-Gm-Message-State: APjAAAXdqyQN8JoJCoZf+GNuXZuz7vHh1dNQJHeTX6Tvp+VqG+moWa2Y
 KvQcOfQEGBPn9UFnzA3H0dfhbhHMwiQ=
X-Google-Smtp-Source: APXvYqyuM7wOcBTjeScSuO9H8vXIDps5SKi+kY5qcdZ/phats8pct/QoxMip1HIFc4UfQT0gm5y/Og==
X-Received: by 2002:a37:afc3:: with SMTP id
 y186mr63596351qke.115.1564168138843; 
 Fri, 26 Jul 2019 12:08:58 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id z21sm21581263qto.48.2019.07.26.12.08.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 12:08:56 -0700 (PDT)
Message-ID: <f86af078c7024c2285641386e2b6f1d255d9dbca.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org
Date: Fri, 26 Jul 2019 15:08:55 -0400
In-Reply-To: <20190726141715.A6C48218D3@mail.kernel.org>
References: <20190725194005.16572-3-lyude@redhat.com>
 <20190726141715.A6C48218D3@mail.kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau: Don't retry infinitely when
 receiving no data on i2c over AUX
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
Cc: Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDE0OjE3ICswMDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPiBI
aSwKPiAKPiBbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCj4gCj4gVGhpcyBjb21taXQgaGFz
IGJlZW4gcHJvY2Vzc2VkIGJlY2F1c2UgaXQgY29udGFpbnMgYSAtc3RhYmxlIHRhZy4KPiBUaGUg
c3RhYmxlIHRhZyBpbmRpY2F0ZXMgdGhhdCBpdCdzIHJlbGV2YW50IGZvciB0aGUgZm9sbG93aW5n
IHRyZWVzOiBhbGwKPiAKPiBUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczog
djUuMi4yLCB2NS4xLjE5LCB2NC4xOS42MCwKPiB2NC4xNC4xMzQsIHY0LjkuMTg2LCB2NC40LjE4
Ni4KPiAKPiB2NS4yLjI6IEJ1aWxkIE9LIQo+IHY1LjEuMTk6IEJ1aWxkIE9LIQo+IHY0LjE5LjYw
OiBCdWlsZCBPSyEKPiB2NC4xNC4xMzQ6IEJ1aWxkIE9LIQo+IHY0LjkuMTg2OiBGYWlsZWQgdG8g
YXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPiAgICAgMWFmNWM0MTBjYzBjICgiZHJtL25v
dXZlYXUvaTJjOiBtb2RpZnkgYXV4IGludGVyZmFjZSB0byByZXR1cm4gbGVuZ3RoCj4gYWN0dWFs
bHkgdHJhbnNmZXJyZWQiKQoKc2tpcCB2NC45Cj4gCj4gdjQuNC4xODY6IEZhaWxlZCB0byBhcHBs
eSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgo+ICAgICAxYWY1YzQxMGNjMGMgKCJkcm0vbm91dmVh
dS9pMmM6IG1vZGlmeSBhdXggaW50ZXJmYWNlIHRvIHJldHVybiBsZW5ndGgKPiBhY3R1YWxseSB0
cmFuc2ZlcnJlZCIpCj4gICAgIDJlZDk1YTRjNjVhMyAoImRybS9ub3V2ZWF1OiByZWNvZ25pc2Ug
R00yMDAgY2hpcHNldCIpCj4gICAgIDc1NjhiMTA2NzE4MSAoImRybS9ub3V2ZWF1L252aWY6IHNw
bGl0IG91dCBkaXNwbGF5IGludGVyZmFjZQo+IGRlZmluaXRpb25zIikKPiAgICAgN2QyODEzYzQz
N2EwICgiZHJtL25vdXZlYXUvbHRjL2dtMjA0OiBzcGxpdCBpbXBsZW1lbnRhdGlvbiBmcm9tIGdt
MTA3IikKPiAgICAgZGIxZWI1Mjg0NjJmICgiZHJtL25vdXZlYXU6IHMvZ20yMDQvZ20yMDAvIGlu
IGEgbnVtYmVyIG9mIHBsYWNlcyIpCj4gICAgIGUzZDI2ZDA4NjA5MiAoImRybS9ub3V2ZWF1L2li
dXMvZ20yMDQ6IHNwbGl0IGltcGxlbWVudGF0aW9uIGZyb20gZ2sxMDQiKQo+IAo+IAphbmQgc2tp
cCB2NC40Cgo+IE5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBiZSBxdWV1ZWQgdG8gc3RhYmxlIHRy
ZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgo+IAo+IEhvdyBzaG91bGQgd2UgcHJvY2VlZCB3aXRo
IHRoaXMgcGF0Y2g/Cj4gCj4gLS0KPiBUaGFua3MsCj4gU2FzaGEKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
