Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC4605F3
	for <lists+nouveau@lfdr.de>; Fri,  5 Jul 2019 14:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D26E497;
	Fri,  5 Jul 2019 12:33:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1C6E499
 for <nouveau@lists.freedesktop.org>; Fri,  5 Jul 2019 12:33:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so7741755qkl.4
 for <nouveau@lists.freedesktop.org>; Fri, 05 Jul 2019 05:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SM8/4exhoEHGZvFQb+ptk62AOWI2rKv8kDwMIolo8dI=;
 b=SRz2V5zW4KDBaApYx8uK6TN2E0tHIfLV8xJeWGWMaHfUKXVnRdc31ZAilBFh10llpx
 RQggNTfgCYqBb5wWdpykttJpyj546nIaqYnjatUCqlUCfKfLhdt9+OUStOeS1RT9uIu4
 EHdZTEGpd+SCurPJqiy5HxaSVxB8PA2bJiP7LF70dtkKYNztcCx/pB4nb+jIo0P0mpte
 E19/4t4UQF1nR2gNnkDCMK/jgtxehPiD8aARDnrt62DDj2/+4fp+uAADvhwmesQ/wcY0
 ejGH0QyLFKl51yL3MYsApAqIMAfx1zAFOrlZMeea9xuDpyAtbKtosXvPR8Dh4Q8BJr//
 rqqw==
X-Gm-Message-State: APjAAAUK1WDnNDcLUVA+MA8pKmAfj8dn4lgGQduZoU1L8ZRvBy4L8nWK
 0wBorqL15ZhbYXrB9IZLFKKuxw==
X-Google-Smtp-Source: APXvYqyX4DTV+YYFhT5OJ/l0wgbSemi0wOkZLMZP/Jtfy+M9HG6Dx7KgQV0v8jgq8UDEfu8Mwq0uQg==
X-Received: by 2002:a37:a1d6:: with SMTP id k205mr2848006qke.171.1562330018204; 
 Fri, 05 Jul 2019 05:33:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id z33sm2504614qtc.56.2019.07.05.05.33.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 05:33:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hjNPE-0008UP-St; Fri, 05 Jul 2019 09:33:36 -0300
Date: Fri, 5 Jul 2019 09:33:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190705123336.GA31543@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=SM8/4exhoEHGZvFQb+ptk62AOWI2rKv8kDwMIolo8dI=;
 b=ckYufb+JTejpyz8pDQLhV2fiq+FAfmAMJXOQOHzRQuW89WYkHU4Lnaf8DM+LDzsQly
 7DR9KgHXKyZJ5SQnARXpB7b0GDPR+IzumhAhjFElKZoaWbVQqBzOGuOt2mXTD7nzuXt5
 rht4Mpc03KaerdCaAGd9Zz+VR1Rrl9rREPc+1J7nPBLLCwdHhPvxkD51oec3BWxH/q5A
 8y8smn0+FXxH8Gikf6Oak6WiJwqqFwAOKVh2vW+4toDJIiGZgqAhD4f+Uc2n5IztDsqL
 u3oZpE+TduYcqojeNfFd5skXHK2hBtPlP72gQxG0RENMyEEMZ5xl0dJFmnFf9EpIr4ix
 WIHQ==
Subject: Re: [Nouveau] hmm_range_fault related fixes and legacy API removal
 v2
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
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCj4gCj4gYmVsb3cgaXMgYSBz
ZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4g
bG9ja2luZyBpbiBub3V2ZWF1IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIg
bGVnYWN5IEhNTSBBUElzCj4gb25seSB1c2VkIGJ5IG5vdXZlYXUuCgpBcyBtdWNoIGFzIEkgbGlr
ZSB0aGlzIHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0byB0aGlzIG1lcmdlIHdpbmRvdywKc29y
cnkuCgpMZXQncyByZXZpc2l0IGl0IGluIGEgZmV3IHdlZWtzIGF0IHJjMS4KClJlZ2FyZHMsCkph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
