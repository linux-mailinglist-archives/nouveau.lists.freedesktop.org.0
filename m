Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA112B2B6
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6AF6E082;
	Fri, 27 Dec 2019 08:13:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672E76E2F0
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2019 12:51:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c26so1299684qtj.10
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2019 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZF5YLLdkMxOeBnT3AEdovjyBEmTM+OTs+LDLPN0GMI8=;
 b=IHV+AJapDR5k8D6Zafc6ml2K0fa/jgF1PZBiuBMaOa/r+MK0PJ0xNtRtLiwXM8hfUM
 oyGHNxRN/O07FITOaIm5BnO1Box0mj0QkuPEB2wMXMWKVbmYTzXQRMncmXuCTctBu7gC
 91FIwEspUa/0nc1TUQ+oissChI6D4nJBO8DA40LneE6r/MnEh4dPTkicbi1e9mKDMq4W
 wpip0eIgYwCfGlBN5ll9Ug3VTlK7wx3iCECoDUwBIIk+qI/2gjDdaegrEPvi6otVA07c
 HtuIQ3uKH0+5jfdbr9pByZT3cPdoijw2I2FMN1xWV5tXm87jeYeH8MJjI7uCkOjTfH2C
 whzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZF5YLLdkMxOeBnT3AEdovjyBEmTM+OTs+LDLPN0GMI8=;
 b=QFIUjs1ToNRB4mzNU6ijBjn9ycRPjPnZoaUDEYsP1oyupu3oaeUZog0H2u+nyRi49x
 Y6/XwvxnrCDpmKx9yqhnBEao83ro43aAJBmMqFxDVapKZtgjZEUg6zQ8vUP4KIZ/JSSE
 mL282Y50aec/g0zMz1EZfE3zyR1UkFN9LWT+w8XK6KEifx/+R3/4hFP1ikv6svE+G6Vg
 s+5hmvAXdFYhs+yfXgpzq5KVN72pBB74zNiX2DugHE95eCtZaRQoFmSq7joUW1OCh7bm
 LQHko1FAEAL/Fp5jAcJD4z68KkHpUJxDyrX8bTAX4yqyJBJHRa9KsOjl/DVEZp3hkYat
 4VMw==
X-Gm-Message-State: APjAAAVW7gQzHBr6+6JWlA68GP6vbMzDNywdauZKKNuGe+ZrZaRcEcD9
 rosE9jvU3/LovH8GEqfkodUHBA==
X-Google-Smtp-Source: APXvYqxq0ay2DLP144wUqH2TJqeYs+CM1CzDDTCAEHT8qLG70HSD8wcaxvvKBHRgPHlzCMTknReLGQ==
X-Received: by 2002:ac8:219d:: with SMTP id 29mr4121236qty.280.1572353492189; 
 Tue, 29 Oct 2019 05:51:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id w69sm4027395qkb.26.2019.10.29.05.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 05:51:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPQyB-000522-4r; Tue, 29 Oct 2019 09:51:31 -0300
Date: Tue, 29 Oct 2019 09:51:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <20191029125131.GC6128@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-7-jgg@ziepe.ca>
 <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 06/15] RDMA/hfi1: Use
 mmu_range_notifier_inset for user_exp_rcv
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, Felix.Kuehling@amd.com,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2019 at 08:19:20AM -0400, Dennis Dalessandro wrote:
> On 10/28/2019 4:10 PM, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > This converts one of the two users of mmu_notifiers to use the new API.
> > The conversion is fairly straightforward, however the existing use of
> > notifiers here seems to be racey.
> > 
> > Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
> > Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> 
> I tested v1, and replied to it [1]. I can re-test with this version if you
> like as well.
> 
> [1] https://marc.info/?l=linux-rdma&m=157235130606412&w=2

I think it is fine, nothing really changed in v2, thanks

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
