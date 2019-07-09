Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28AE63BF6
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2019 21:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B9D89CCB;
	Tue,  9 Jul 2019 19:33:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22F289D44
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2019 19:33:22 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so25401qkk.5
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2019 12:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TqnFX/ucbxcY5k2LU8B7XgzLfUpDzAFYa9LXap9J5UU=;
 b=Bt/8IuDh37Z24uz+ScSvJxbg6xdFZj7mC/L7rRQtJaTMqsN2ySkJbNfFd+h+SwokJi
 xcVzYbg5nD1pTeosv5CFuJY7mHr1ZND+trhTs2qXtdA7rFTMTZarApJiBosq85R4KQTL
 bUq4Av304gTb/qyNXLYAOnjj48YJLAcNdHchcW+5hJiwwiz7Z/O2cCf03tM+kZ/wwr4t
 hy/HO58q20bP9de+ToWDoLn4wQY7CJsIia4s6UsrmzNy44GkuP4OpeGUFJRBetmeHfn3
 +MVYBpJCpOn7RMdgFKkuMLCYo2P8+9Dg0OwRtp8Cf51tVwgzQ4n6kZAealcT1LZPST5s
 tJBA==
X-Gm-Message-State: APjAAAXAUxRR3Cr4Kt7HKpAY0iyCnzh2SYSFYBNDH6T0kEi1RuEJX8Zg
 lM9MAK+2oM6+2HVcqKh6yAuHUQ==
X-Google-Smtp-Source: APXvYqwJv1A9aQVqldMtbeBQ5nnec3iTfBKL3S6OeKUyA3kkYjNI/CON0uVEHClqFsFEEJNKMO/I9A==
X-Received: by 2002:a05:620a:1006:: with SMTP id
 z6mr2854127qkj.312.1562700801760; 
 Tue, 09 Jul 2019 12:33:21 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 67sm9662013qkh.108.2019.07.09.12.33.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Jul 2019 12:33:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hkvrc-0003nt-Rl; Tue, 09 Jul 2019 16:33:20 -0300
Date: Tue, 9 Jul 2019 16:33:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190709193320.GD3422@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
 <20190705123336.GA31543@ziepe.ca> <20190709143038.GA3092@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709143038.GA3092@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=TqnFX/ucbxcY5k2LU8B7XgzLfUpDzAFYa9LXap9J5UU=;
 b=nJSBYwdxUv5VMP0rEUMz93pcWQ28dTbOLxoOwrWHLWCf1MSxkLTpKz2x8fxtV2+E/R
 tXsUU3isWUYxjOPUM6t0qCMv560B5H1unNR0QcR5JPw3ycBYCoKo4LDe/wsMqNEhL/zl
 ZczdjxlpNisocOP3/OhjpkUf2xKW2V9mrCM6eDI3EmS5aK4e6AbXWsFA/MaZCNHhyEnk
 w4Z42pcMYK3A/nvN2x/95LPHdAv9lAcaP70awzU4Hvnyy2CUphCP4NqDwoLxyz/O5kpd
 AcIgjMsPHoTqJr8TeoXVzKWAKEnMRS83pZDgNEkgwGuWMagj18LeXUOa06mYcaDBm5pC
 i90Q==
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

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDQ6MzA6MzhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQ
TSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEhpIErDqXLDtG1lLCBCZW4g
YW5kIEphc29uLAo+ID4gPiAKPiA+ID4gYmVsb3cgaXMgYSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1t
IHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4gPiA+IGxvY2tpbmcgaW4gbm91dmVh
dSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRvdmVyIGxlZ2FjeSBITU0gQVBJcwo+
ID4gPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPiA+Cj4gPiBBcyBtdWNoIGFzIEkgbGlrZSB0aGlz
IHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0byB0aGlzIG1lcmdlIHdpbmRvdywKPiA+IHNvcnJ5
Lgo+IAo+IE5vdGUgdGhhdCBwYXRjaCA0IGZpeGVzIGEgcHJldHR5IHNldmVyZSBsb2NraW5nIGJ1
ZywgYW5kIDEtMyBpcyBqdXN0Cj4gcHJlcGFyYXRpb24gZm9yIHRoYXQuICAKClllcywgSSBrbm93
LCBidXQgdGhhdCBjb2RlIGlzIGFsbCBtYXJrZWQgU1RBR0lORyBsYXN0IEkgc2F3LCBzbyBJCmRv
bid0IGZlZWwgYW4gdXJnZW5jeSB0byBnZXQgc2V2ZXJlIGJ1ZyBmaXhlcyBpbiBmb3IgaXQgYWZ0
ZXIgdGhlCm1lcmdlIHdpbmRvdyBvcGVucy4KCkknZCBsaWtlIHRvIGFwcGx5IGl0IHRvIGhtbS5n
aXQgd2hlbiByYzEgY29tZXMgb3V0IHdpdGggUmFscGgncyB0ZXN0CnJlc3VsdC4uCgpKYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
