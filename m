Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA8906C0
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 19:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BC86E392;
	Fri, 16 Aug 2019 17:23:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508806E392
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2019 17:23:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g17so5302924qkk.8
 for <nouveau@lists.freedesktop.org>; Fri, 16 Aug 2019 10:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pD8Tbdojb+tV/T42U7/Bt4fJei4dk6nxHPESNZBzUPg=;
 b=T3cMHRSCmURUiERNq7s1B7RlidRwSYYlNzDFoKfxG1Ah74Rjm5NpVg0qWgFFaCDOK0
 Urpd0kwqPvHiRqq9bISYBVMr5e8w9Qb6QbUjkZvil65n7Mmd/XZJT2UNa7fCEJtIzj7M
 XlHI81uqdEavYFpuLM1wOi3VtX8l2KFIWTTlEWAZL4F6reDcR2XDDzgAHAPHZULAZ1YS
 wJOdsYnl6E9I/mwdooXGE++Kb2UeliIY4B3M/TlHsvAkoRAmwV7v/LDeiY6BDqdj+J0Y
 rasicl4Vphp4t4I4L53Qe9PezkyYPsahD0N7MWb4XedKdUcYQ6/YJkN6OxxZEF8MwqPd
 Uoaw==
X-Gm-Message-State: APjAAAXKO+Ivsxhif6cyVzQD2GF7TuriOkOSC76ymZuMUmXcQ5CV3W7b
 icrTkc87L2+ii+QO7yvJz+p9qA==
X-Google-Smtp-Source: APXvYqyAuZxMtBrIj2lrXbWPNUHVpEBKMq4p2dvILNeEBwhH8SLFMps9jaKCtPjbt9+U/fOmx5c77w==
X-Received: by 2002:a37:805:: with SMTP id 5mr9982722qki.351.1565976207466;
 Fri, 16 Aug 2019 10:23:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 23sm3185723qkk.121.2019.08.16.10.23.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 10:23:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyfwk-0000tb-MA; Fri, 16 Aug 2019 14:23:26 -0300
Date: Fri, 16 Aug 2019 14:23:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190816172326.GI5398@ziepe.ca>
References: <20190814075928.23766-1-hch@lst.de> <20190816065141.GA6996@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816065141.GA6996@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pD8Tbdojb+tV/T42U7/Bt4fJei4dk6nxHPESNZBzUPg=;
 b=PKOKEY8hGxaOdpj1T8hBrDGYtsUrnU0AObkNmorj7jn7hBXpX2Kp/ztvI9DGVCYTQE
 dc7AfGY5084FNsyK1iFgRwps/IMRwPx5SDeHZ6iG6Vx1Auh9Jiwqi8IwIFgmkC1IyaaP
 ZG/0N27IRdZCGF/hPvMRXRbsTrG+8jAJ2xVMkv6g6aeYSe5QxCHrQ2ZmirGBi7NhhAtL
 8LPoo597le/ShD9ep2nuha5j6xRqGlB/XWU5NWICIfVLLTfLX0mziYqsaSh3ZaTmUF0u
 cvAphTs2Z1DvPDJOzISG6/SYjf5j85EYdPNZa7ztM4aMs2xfCrXlpdbNpKuWGh1E+PLB
 PLqA==
Subject: Re: [Nouveau] turn hmm migrate_vma upside down v3
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDg6NTE6NDFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSmFzb24sCj4gCj4gYXJlIHlvdSBnb2luZyB0byBsb29rIGludG8gcGlja2lu
ZyB0aGlzIHVwPyAgVW5mb3J0dW5hdGVseSB0aGVyZSBpcwo+IGEgaG9sZSBwaWxlIGluIHRoaXMg
YXJlYSBzdGlsbCBwZW5kaW5nLCBpbmNsdWRpbmcgdGhlIGt2bXBwYyBzZWN1cmUKPiBtZW1vcnkg
ZHJpdmVyIGZyb20gQmhhcmF0YSB0aGF0IGRlcGVuZHMgb24gdGhlIHdvcmsuCgpEb25lLAoKTGV0
cyBzZWUgaWYgRGFuIHdpbGwgY29tbWVudCBvbiB0aGUgcGFnZW1hcCBwYXJ0IChsb29rcwpzdHJh
aWdodGZvcndhcmQgdG8gbWUpLCBhbmQgdGhlbiBhZnRlciB3ZSBncmFiIHRoYXQgSSB3aWxsIGRl
Y2xhcmUKaG1tLmdpdCBub24tcmViYXNpbmcgYW5kIEJoYXJhdGEgY2FuIGJ1aWxkIGhpcyBzZXJp
ZXMgdXBvbiBpdC4KCkFzIGEgcmVtaW5kZXIsIHBsZWFzZSBkbyBub3Qgc2VuZCBobW0uZ2l0IGlu
c2lkZSBhbm90aGVyIHB1bGwgcmVxdWVzdAp0byBMaW51cyB3aXRob3V0IG1ha2luZyBpdCB2ZXJ5
IGNsZWFyIGluIHRoYXQgY292ZXIgbGV0dGVyIGFuZCBDYydpbmcKbWUuIFRoYW5rcy4KClJlZ2Fy
ZHMsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
