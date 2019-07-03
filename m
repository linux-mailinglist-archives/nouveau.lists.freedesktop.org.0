Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B948A5EB07
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB406E183;
	Wed,  3 Jul 2019 18:01:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1286E183
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 18:01:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t8so3547837qkt.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Jul 2019 11:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a2vka/akssy/859dgmuGdTYFT4YH52SMxVHx2PN2EUA=;
 b=lrAhIUVF7Zmif8+X2zWyNdHKUEidjwWhcILXu7vOZdyqCz/xc1IoDDXRcESJFVj1nj
 PYdPeGcquMGDc8BnPg5KZYAND3q8YU9V79ORxJ+q2GzZ+EEWvePGFtjLNJU+QavwpRBE
 Jb538h/cidb9fxPMggNG68t4caWokwxoC0a6zthV1B6xzHwesGI//STmQM1uern6cXGu
 wxPwUpO2x1BryZd1mbeUhANj5vGGDAUuNgxh/i6hVgkzDEpluuhUBHl6xab0gEe1/BCe
 pA90UwwgbL0kjsaLns8al1sM+pCsG7X8liqEo7F+Sk772XIa29yj1gHokOlvdA3QBv2n
 fj8A==
X-Gm-Message-State: APjAAAWpcfgfh484bapT5qwif5ClM61lbji8Jh36LWsIHXrudk/9Xqqn
 fvujzMvfq01Zt03/kRoboHWaYjFLcXSv8A==
X-Google-Smtp-Source: APXvYqydaJsLmmJTIUtSU+kahyTjsnRgAp4YEYaGKvpkMDRvv9xpp1xwyaxLhy2xlOb2NB+ML08lUQ==
X-Received: by 2002:a37:a413:: with SMTP id n19mr30343855qke.98.1562176886317; 
 Wed, 03 Jul 2019 11:01:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id u19sm1310165qka.35.2019.07.03.11.01.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jul 2019 11:01:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hijZN-0006oc-AR; Wed, 03 Jul 2019 15:01:25 -0300
Date: Wed, 3 Jul 2019 15:01:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190703180125.GA18673@ziepe.ca>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701062020.19239-23-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a2vka/akssy/859dgmuGdTYFT4YH52SMxVHx2PN2EUA=;
 b=UR+mB33wfBhu3cMDn/7EBIfgFaGZRuvY/6J1fd9PhMgOfBQW4lCtf4aW4cWrAUOg/V
 ysDxZJU9vC+aEmT4cwhxTIl4TYXWNEvXLnwzfoSFoTPuhqs/gUxKo54FOzEU1qF6lBPO
 BDzC9RkbmXZgFl5C89Dr/DavME/J23LtilDnr6BOfCLfGcmh3h3ZqRvCwPxs52Z9/ShV
 88aK4465TTIaWrpxAOzvxt4Awc0wM1VxGtTmtNuDdYn6htswBnMWDqrfqYcoFAAtYDKN
 PK+3yzvEgZr3lVoSgy+/yjpH/TVAkGrizrHi9TWzWfIHt86MDzHjD59dYGp18SQRc4c1
 cphA==
Subject: Re: [Nouveau] [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDg6MjA6MjBBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3dpdGNoIHRoZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVy
IHRvIGl0cyByZXBsYWNlbWVudCwKPiBhbmQgcmVtb3ZlIGFsbCB0aGUgd3JhcHBlcnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgIDIgKy0KPiAgaW5jbHVkZS9saW51eC9o
bW0uaCAgICAgICAgICAgICAgICAgICAgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNyBkZWxldGlvbnMoLSkKCkNocmlz
dG9waCwgSSBndWVzcyB5b3UgZGlkbid0IG1lYW4gdG8gc2VuZCB0aGlzIGJyYW5jaCB0byB0aGUg
bWFpbGluZwpsaXN0PwoKSW4gYW55IGV2ZW50IHNvbWUgb2YgdGhlc2UsIGxpa2UgdGhpcyBvbmUs
IGxvb2sgb2J2aW91cyBhbmQgSSBjb3VsZApzdGlsbCBncmFiIGEgZmV3IGZvciBobW0uZ2l0LgoK
TGV0IG1lIGtub3cgd2hhdCB5b3UnZCBsaWtlIHBsZWFzZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
