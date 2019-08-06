Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB383859
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 20:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212FE6E523;
	Tue,  6 Aug 2019 18:02:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5F86E520
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 18:02:10 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z4so85530819qtc.3
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=IsAvMc6QpwNqvjg5ltDb+JdkmIH0Mpe/3v1aY7muJNec8t7Gw4uvBin1A3DkZl2qFS
 Wsvo6X5b6vKo4bL6daC/BFSv4yw1lEKY281CPb388C/EEjjhwbyWzdcjhWaL1m8GJxfE
 MMZXg4h5lrrtRH+fv9V5yD8YgtsIUHYxgO9T/C/SOAJUKCJaL06oxVwCJ3By/j+zL3Eq
 aW19gKJsIeClJHhuBmLGrhUG8RpGtPbWkgSuNrR/j114Tk5nstDnxxmRrFM7myAMuV7r
 zbG6zFEVAY/edBbUOL6keUFerQ921ux7fNOVdwa9Ad7RDpU0UjkjvHIEtWFoDYzLjXS2
 LqBQ==
X-Gm-Message-State: APjAAAVvP2DlDO87lDkY6lShBHGP5X3x7mYhAX50p21bGPphCfKCtBbm
 mgmOW+Xi3E70A/yYaw+TPhPlWA==
X-Google-Smtp-Source: APXvYqzwT9xNxemQscVlJmSlpGsNQA9yiKA1TtYWgT1CZ65aDe7RTogerUHwfzBX65WGTnxLLbQenA==
X-Received: by 2002:ac8:f99:: with SMTP id b25mr4258745qtk.142.1565114530121; 
 Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w10sm263879qts.77.2019.08.06.11.02.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:02:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3mj-0000H9-63; Tue, 06 Aug 2019 15:02:09 -0300
Date: Tue, 6 Aug 2019 15:02:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190806180209.GN11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-9-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=Fz9mT5h+F2iLSvCsBQC5ggiqblN5sutWqjuhuF03Psd+Uf9SPIthU1SFjsJOpswgqI
 i/rgIdKvSW+0tmW7prrn9Y9533G5r4E6d8zM2DnGZ+TNNPM1MBH1FT1zMnZwkyxWU56W
 iIxNzxmjUm0QE0MLJTbJe3z6JqTvYF91SW6QufY/zMDl+9YGG4y5cVhS4ePPcReybl3S
 5KnATeu6yNsS0v/Exp3ApYHy7cwB4/w0c77CJqZUqewRB2Fv001+6QZuzn3886W/04vb
 HuXkgysTL1jkEq+Yt2WQvBYWRBxT7DYd/4ML1Ga5aZt50ou9KZTiM8DcK7BJNDl2Ss0U
 6iSw==
Subject: Re: [Nouveau] [PATCH 08/15] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDZQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFz
IHRoZSBobWFzayBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gIG1tL2htbS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
