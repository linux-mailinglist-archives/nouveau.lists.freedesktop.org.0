Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486783855
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 20:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03FB89A4F;
	Tue,  6 Aug 2019 18:00:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E91289A59
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 18:00:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so4846462qto.10
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 11:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bxAi2AWxQLWDF2luvIMl7f/UII4L9fAd8kmJBO8r+QM=;
 b=WBFk2TkqvpmKiaQPt128tkC107gjGcNWBVO9mlmWEYVvWAI9tlvm1gcP1g+jiVZCD1
 0vhURit+EecylnENd4rxzuuMZIs0YuAhbOaP9GtwtI/3/+FmpRmwyjsenSEcqFxYwybG
 mp+Qg6cxo3f0Tjr5XNhdOVfHN12EeeKG7NndGvgtCacw0/6HydnY4vhBiXinzDPdErce
 pNx1QNaK7CwD55BfK58MBfKMNl+YxQId0FyOoptF5+qOUC0SiSIfaHraYRvUZwuZkbQg
 YKACJAdQAdOfCHud1bqFS5Gghy0nbtMZefrCbWor/DBNIuX8qp0uMyShR/wVKc+7BoAY
 vSYA==
X-Gm-Message-State: APjAAAVmiSJBCH508KU+1FrGZWAFsf0bRzjfVBW00mLkmHEolQ0lX5Vf
 DhP6MS4Yxv7bgb4E0WB5/actSg==
X-Google-Smtp-Source: APXvYqwCmY0NZ93DbaUKqBGemthRcu66UNlk2zMQT2HujC+QqBl8bAE/pDy0q9npLsbnQ5I+0N19GQ==
X-Received: by 2002:a0c:c107:: with SMTP id f7mr4227804qvh.150.1565114428225; 
 Tue, 06 Aug 2019 11:00:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o12sm36309954qkg.99.2019.08.06.11.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:00:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3l5-0000Eu-8Q; Tue, 06 Aug 2019 15:00:27 -0300
Date: Tue, 6 Aug 2019 15:00:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190806180027.GM11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-12-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bxAi2AWxQLWDF2luvIMl7f/UII4L9fAd8kmJBO8r+QM=;
 b=BTdL1q7uIftWEibqtpJ2qBvmgEl0z+WwHsvtywklotBDG0PpIzsdOkQu2MzqaTeVMo
 J8yB+abqQuKUfiuWe/VFhxZeK+LmVGsRDJrUW0pAsCMH6f998wxdNClpsRBWqGB3q9lb
 DIpOye+uQcyUXo3ondmYhnMZVp8o4EzhV4Jc5CR26nszzO7s8uyzHULN5JfFJg0w74zH
 z8baH6w71w2QWD+OqIA5XxvbMLZRSmwRHv4BH8MQpHSlnp9Rj+9dezQk76GZ8Y6Ui0Zs
 IOpf4eY2syFgOUh+A2Lc1gcx6oZthg+JUv4GWxh92CjWmzVf23Jl3OmhSvoxCjauSNqR
 3A3w==
Subject: Re: [Nouveau] [PATCH 11/15] mm: cleanup the hmm_vma_handle_pmd stub
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDlQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gU3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIHdoZW4gQ09ORklHX1RSQU5T
UEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQKPiB0byBtYWtlIHRoZSBmdW5jdGlvbiBlYXNpZXIg
dG8gcmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgbW0vaG1tLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFz
b24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
