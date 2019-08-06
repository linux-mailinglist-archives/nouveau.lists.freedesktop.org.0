Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93E8385B
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 20:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7C16E511;
	Tue,  6 Aug 2019 18:02:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D66E511
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 18:02:50 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so63680246qkj.12
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J340zbxKrZwPhKQPn9TeC4csGhsk958SAmRA1+an/JE=;
 b=Dg1JoqopQZ2wkZMhyC4IQZrgoymWRSdYVsW94XSVDGVOYRcsHpjeeAkO6HWVu+yC9l
 rZi6sXGSb4lbF87uP7EFTb8uXUQVk29tws6YZFUqfTP0hYifuG2V0y4H1M3LZXwSMILm
 pA6yzpIjTCLRY9YY7VBjyzR6QVjO3rljShntePF68kLkHI8mnv2+kxmTj/UpNDtk5yLx
 Nx1l4C9b0Z8UVagPeZozXtl+2Zx1qbLS+OyvN21OlDX7pMuL0Fs0km6FDsB9+6uf34/Q
 TZGFFr+D33L4wlIUxwpA7LlmPsWKEFEI3SnrBfrB9QYeW5G7RAR4FY8bVEvtFMys9179
 tmQg==
X-Gm-Message-State: APjAAAUJLIFzvUs7tOmURjJPnmPemy0UwTzeMILiwe1onYsICJLRN3RA
 dcUmQ62Gcx9CETPJAPbJ7bzZpg==
X-Google-Smtp-Source: APXvYqzeVullh9O51A7m3TZsWYHDgm0ndSlca+disOdIT8zFGqnFmyETv0vAgxjYTLrTqv0QWoZpMA==
X-Received: by 2002:a37:7704:: with SMTP id s4mr4481690qkc.310.1565114569197; 
 Tue, 06 Aug 2019 11:02:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c18sm6024222qtj.25.2019.08.06.11.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:02:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3nM-0000IY-6M; Tue, 06 Aug 2019 15:02:48 -0300
Date: Tue, 6 Aug 2019 15:02:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190806180248.GO11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-4-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J340zbxKrZwPhKQPn9TeC4csGhsk958SAmRA1+an/JE=;
 b=dmyRhMBZI6zY0I2u7wdyHQjMKNx7X6q/44JyGKfb/VDswyFMmZFRkfFHuwa6xb9W77
 /60SemHut0sNFpXi8VWhLEujUvdmhIPrdRNkn3/J8WP+d2+9yM+59k7uYRD0oXqoGmkv
 AdAgySgMZPnuRZQMrufc/1lAUL2PUjg7rsZvJGuL8Mj2mTI3z0O2wFRQECzd2fD6TiTN
 BOs8Eu8913OI8Gc+ity2XD16jj+X32RK4PRj79qKdpLBOcODvMrV18XBvn3mOzh3Diqj
 awOnPn2b4LSHKJWlA/RvcCNCNU2eXDwXISITGSPgHG1GksuEOvVSXUJKrqxO2IQiTL/B
 Xh+g==
Subject: Re: [Nouveau] [PATCH 03/15] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDFQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gV2UnbGwgbmVlZCB0aGUgbm91dmVhdV9zdm1tIHN0cnVjdHVyZSB0byBpbXBy
b3ZlIHRoZSBmdW5jdGlvbiBzb29uLgo+IEZvciBub3cgdGhpcyBhbGxvd3MgdXNpbmcgdGhlIHN2
bW0tPm1tIHJlZmVyZW5jZSB0byB1bmxvY2sgdGhlCj4gbW1hcF9zZW0sIGFuZCB0aHVzIHRoZSBz
YW1lIGRlcmVmZXJlbmNlIGNoYWluIHRoYXQgdGhlIGNhbGxlciB1c2VzCj4gdG8gbG9jayBhbmQg
dW5sb2NrIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMTIg
KysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
