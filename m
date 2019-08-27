Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AC9F5FD
	for <lists+nouveau@lfdr.de>; Wed, 28 Aug 2019 00:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA68E89B97;
	Tue, 27 Aug 2019 22:22:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F6589B97
 for <nouveau@lists.freedesktop.org>; Tue, 27 Aug 2019 22:22:22 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t12so716510qtp.9
 for <nouveau@lists.freedesktop.org>; Tue, 27 Aug 2019 15:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O/Eb9Yv9aHdMVq7eZpOlz+xzQGez6PZaf9uMsvKFVSk=;
 b=Ma33LpdY7gHySBs6OCu/zj28fr2I6dQNe64ftjKwbG8BRb3YhULemuN5lWQ3uELLIZ
 RY+7DDs5C/sKXQruurYivUHKClVmGk+tNu/QEnQHa1TQ+yt4bR1ShS0KdFnAosCCSzBV
 X6rToTjBSiUZ4frAzzAGJ/SQHwP3P99WuIDpj9Aw8h8C3D2wYQ24s1YEKpsru8UCToR3
 yQfs0DBjQZC5nqvj29TBlcFQbyg4e7Pr0/PPn0/0T0Kf2AO5Bre9JH6kV0SNYt/v8Exg
 e50z/BE4okm49HUIsPRESXkmtRZLV3s/RU4LacA7EyD+93ksrjG2WAzPnMN2RJN5KPRM
 xCPQ==
X-Gm-Message-State: APjAAAUuS3/KdExVGR90XF27XT+ZjHW3pVJJ2uoG2Z1u23q+jLtmsBLz
 f/RlZVNITf8W0dfFPZxcxJtdRw==
X-Google-Smtp-Source: APXvYqyjufzPEUsNxQkLMwFYT3vRSJjpNbEwwYE37k3KlJ9jZ4hz+iVzDJ0578B4zjHZuy1e3Jd+Ag==
X-Received: by 2002:ad4:47c3:: with SMTP id p3mr808533qvw.120.1566944540997;
 Tue, 27 Aug 2019 15:22:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id y25sm408767qkj.35.2019.08.27.15.22.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:22:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2jr1-00080x-Hu; Tue, 27 Aug 2019 19:22:19 -0300
Date: Tue, 27 Aug 2019 19:22:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190827222219.GA30700@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
 <20190827184157.GA24929@ziepe.ca>
 <f5c1f198-4bdd-3c23-428f-764f894b9997@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5c1f198-4bdd-3c23-428f-764f894b9997@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O/Eb9Yv9aHdMVq7eZpOlz+xzQGez6PZaf9uMsvKFVSk=;
 b=S5udK1mCM17tEnM8qe/Euf0h6hUrQ+FsIrJswR0TUa9fPCRYoUQo2Bj0vFq0Fv5x7W
 brf7rtaaLWpCWBBcKPEArqo55P7LK9Y+3eaAJqaKFm9q2TqOIryQNcOTxeO43ahRyXMz
 +78BCiCK8tOS1KfOCv/vOzajMjclnKu+sqNB45ittMbYMfVVgnS3nM2+4LsDNk/3U5wE
 KGi8UiI7+GqWkinARDlIKI/eUAIOW3lDoAfSJWFqbiG0llZz8rTszgW14HlsyNgX7pzb
 W7N9EDComqNskKX+zkqao8RVYlPByzJ2Rr93KmNG9Ioy0A2C6bMSUxiivkfsaaJUAjXo
 HBtw==
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDE6MTY6MTNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gOC8yNy8xOSAxMTo0MSBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTNQTSAtMDcwMCwgUmFscGggQ2FtcGJl
bGwgd3JvdGU6Cj4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgo+ID4gPiAgIG1tL2htbS5jIHwgMyArKysKPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vaG1t
LmMgYi9tbS9obW0uYwo+ID4gPiBpbmRleCAyOTM3MTQ4NWZlOTQuLjQ4ODJiODNhZWNjYiAxMDA2
NDQKPiA+ID4gKysrIGIvbW0vaG1tLmMKPiA+ID4gQEAgLTI5Miw2ICsyOTIsOSBAQCBzdGF0aWMg
aW50IGhtbV92bWFfd2Fsa19ob2xlXyh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcg
ZW5kLAo+ID4gPiAgIAlobW1fdm1hX3dhbGstPmxhc3QgPSBhZGRyOwo+ID4gPiAgIAlpID0gKGFk
ZHIgLSByYW5nZS0+c3RhcnQpID4+IFBBR0VfU0hJRlQ7Cj4gPiA+ICsJaWYgKHdyaXRlX2ZhdWx0
ICYmIHdhbGstPnZtYSAmJiAhKHdhbGstPnZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkpCj4gPiA+
ICsJCXJldHVybiAtRVBFUk07Cj4gPiAKPiA+IENhbiB3YWxrLT52bWEgYmUgTlVMTCBoZXJlPyBo
bW1fdm1hX2RvX2ZhdWx0KCkgdG91Y2hlcyBpdAo+ID4gdW5jb25kaXRpb25hbGx5Lgo+ID4gCj4g
PiBKYXNvbgo+ID4gCj4gd2Fsay0+dm1hIGNhbiBiZSBOVUxMLiBobW1fdm1hX2RvX2ZhdWx0KCkg
bm8gbG9uZ2VyIHRvdWNoZXMgaXQKPiB1bmNvbmRpdGlvbmFsbHksIHRoYXQgaXMgd2hhdCB0aGUg
cHJlY2VkaW5nIHBhdGNoIGZpeGVzLgo+IEkgc3VwcG9zZSBJIGNvdWxkIGNoYW5nZSBobW1fdm1h
X3dhbGtfaG9sZV8oKSB0byBjaGVjayBmb3IgTlVMTAo+IGFuZCBmaWxsIGluIHRoZSBwZm5zW10g
YXJyYXksIEkganVzdCBjaG9zZSB0byBoYW5kbGUgaXQgaW4KPiBobW1fdm1hX2RvX2ZhdWx0KCku
CgpPa2F5LCB5ZXMgbWF5YmUgbG9uZyB0ZXJtIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gZG8gdGhl
IHZtYSBudWxsIGNoZWNrCmNsb3NlciB0byB0aGUgc3RhcnQgb2YgdGhlIGNhbGxiYWNrLCBidXQg
dGhpcyBpcyBhIGdvb2QgZW5vdWdoIGJ1ZyBmaXgKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
