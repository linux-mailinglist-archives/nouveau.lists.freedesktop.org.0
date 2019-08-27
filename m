Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334539F28A
	for <lists+nouveau@lfdr.de>; Tue, 27 Aug 2019 20:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001989791;
	Tue, 27 Aug 2019 18:42:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3328B897FF
 for <nouveau@lists.freedesktop.org>; Tue, 27 Aug 2019 18:41:59 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z4so71781qtc.3
 for <nouveau@lists.freedesktop.org>; Tue, 27 Aug 2019 11:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ceAN/Yoez35TeAjbDhFK5DksMbw1eL2zoww/c7DDSE=;
 b=aPyNZfVNY/NyoGe54q0iCWFV/YsG9IFNP2AJYeCHyAmLIgb9Ao/lADjbrIQmkR2ygh
 mMA2PDPX9Us13gKtcjI3Y0MQt9cHPZ1d42+jn8XocWnLkoT0LTurgKQYzv/foKYgB5KU
 K0VdmQGzWQ7rtrJLPzEVQmJSgPL9fiufT2K6Vuwwh2NIwuPlGa6DJB/+sWTwkCit9U9j
 B/fAwO0T4pKJEzK4T/lT47T32I64DwBL2z5wSVIYAJqVoVsUmwGmu0FxubKEILj4ZcXd
 unkacdTK3mo88aMgHEwCROZhFcfZ23cCxVTWTdLyPejZZ/ccAHXCodQvFe/etGQAQrV9
 7t0g==
X-Gm-Message-State: APjAAAVcTEyF6mre2Y1Z2yAqN6OWrMFka4EDt/9a7ySoAcOcByUYgTne
 lBYO/TMZZJKfivZ6pT5yN9aOYA==
X-Google-Smtp-Source: APXvYqxGsIEH37K7EHHZpDcbxKJ2Zt/WeLY+aot3NzZQz1/QF/DaeFShLNUpqkv0bACqFBQq4QCy2g==
X-Received: by 2002:ac8:23cf:: with SMTP id r15mr242835qtr.97.1566931317969;
 Tue, 27 Aug 2019 11:41:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id x28sm9926373qtk.8.2019.08.27.11.41.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 11:41:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2gPl-0006d2-1c; Tue, 27 Aug 2019 15:41:57 -0300
Date: Tue, 27 Aug 2019 15:41:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190827184157.GA24929@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823221753.2514-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9ceAN/Yoez35TeAjbDhFK5DksMbw1eL2zoww/c7DDSE=;
 b=Tg3wAqzKDb2Nvtp5xnTJu8Zd7Xoskps6KbP7KGSG2mXkHL1YpVlpacJxibryLDlNJw
 179cDfjV75KnOnbO786z8kq561zwavu/nufenfX6VMltb+S29UuroexvGBTlW43jXQmu
 BnfnPJVVYk2s3RHioNaSV2iGEh7jX3UBGoPb1YLczXEMrlSdBRwoauSdVh1dnk3odz81
 5DTC0TRiSs3uSv6gH+zLxmF3Fs8g9ISCjSxPwwihfMHKeWeF5bYqA+q9TtOOx2nNKZ8P
 Zp8VHkM7RZiKWOrFRQbrnX0L3PbEWZuZHj7c02SuCN1iqneJHz/alYfeQVVF1tfTWxVj
 JRYw==
Subject: Re: [Nouveau] [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlh
LmNvbT4KPiAgbW0vaG1tLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCAyOTM3MTQ4
NWZlOTQuLjQ4ODJiODNhZWNjYiAxMDA2NDQKPiArKysgYi9tbS9obW0uYwo+IEBAIC0yOTIsNiAr
MjkyLDkgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaG9sZV8odW5zaWduZWQgbG9uZyBhZGRy
LCB1bnNpZ25lZCBsb25nIGVuZCwKPiAgCWhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7Cj4gIAlp
ID0gKGFkZHIgLSByYW5nZS0+c3RhcnQpID4+IFBBR0VfU0hJRlQ7Cj4gIAo+ICsJaWYgKHdyaXRl
X2ZhdWx0ICYmIHdhbGstPnZtYSAmJiAhKHdhbGstPnZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkp
Cj4gKwkJcmV0dXJuIC1FUEVSTTsKCkNhbiB3YWxrLT52bWEgYmUgTlVMTCBoZXJlPyBobW1fdm1h
X2RvX2ZhdWx0KCkgdG91Y2hlcyBpdAp1bmNvbmRpdGlvbmFsbHkuCgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
