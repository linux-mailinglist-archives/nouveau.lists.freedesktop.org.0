Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B4B0E957
	for <lists+nouveau@lfdr.de>; Wed, 23 Jul 2025 05:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD0310E03B;
	Wed, 23 Jul 2025 03:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iSAETgyp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAC010E098
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jul 2025 03:51:46 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-749248d06faso5294862b3a.2
 for <nouveau@lists.freedesktop.org>; Tue, 22 Jul 2025 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1753242706; x=1753847506; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r0yhqhfmgcWd4Boy+yEMxc9KNWgoVjI2gD67+Le01vg=;
 b=iSAETgypmrizabcldGMRXIuOKBbJEAgGEcK5gh/3qHa4ZBW4y6nIOy0yjG6eJCa9NO
 7ASj8XuKGnE5ZRzLB9Sbzs3+65tE54J9bWZHa6FCf+QyLbYQihDtFhpWY4aqus/hmdVu
 bpvAcsC7YYzok4xPRvN0r9pMQJ+wMp1XWgkMQrjyDQySpPWzZ6+0aNJId4xjCE/E+cpN
 lzNLLKp8Z9OZUDaA4vdN0CbgCsqqWWleS2tjHvUJCtCjVB2SSMWm2jou+6i2nFzC+BYT
 AnsgOdl56R+46UZ2XaUN4Ud35wtk1gMwLZKIf/2wNwx1SwzmNyWVTS4JxqMkIZQYhauB
 CBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753242706; x=1753847506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0yhqhfmgcWd4Boy+yEMxc9KNWgoVjI2gD67+Le01vg=;
 b=rAPoQY/Eh94NTWj0y9zTuvVrbWcHK+ZERjfOodj+r77GDK7XWoeLfWQq+ve4qoZE9y
 ilCwEzv5plmvoE6/uxnJAqPMqF0WXGXMdx/avbsCwO/GyLeMRSeROFzk6uXg4m2E46qu
 IZq1WOeZYbQTE7+TfU8lxbUUyurJpR9l8r3Vi8bEobduSmM/iaTzmjHI/p3T+mOjDjWH
 VJfNjVBMjRFTdq3wuS1+RzL2ktdIWcR0YMYaY0Uln3hnC6W4kfKdhglorHPSY2OAm+xp
 TvB8lwn+SzwtJ2vC+D01i1VQGofhQ5bC7SMEGk2OZ7zThVS1FvoNP5FB0qviG/8scTss
 AWTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNORtaV+FHF6hsJVGsqlwO9N+yoJlN8xB5WK/XDdWBfmr8B8bUFxCiQzOhDN7nov1LDLouUCJe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFM5gGaSp3aWATs0iJE5IN14aWTb+++ou689fHLt6ho4kr7nxp
 aqaFriA1P3YOnFzkeJMOBAspbVXkGNjiVnn0dCGq/8g2YkJHBUCpHu6t4VoyNe7BZT8=
X-Gm-Gg: ASbGncv56frETv2nx84PUpoJQ+fRwlDLXgglDKwyUtENmaI7Mnb7l4Wb9BdaMoBmP+Q
 obZwRgOo4paIHqlsjNoMydB05ti0pddSIP1MiH5M8WLq8tYNE+QWK1LSeESzuNIKeVCIsmcfnS/
 OYlW889Ql+TTf9d3miEC5SR0Chh0zx7f59eIvgcHF64dmLnTnwmsoOmv+mfIKYKlB7Vy/ut/5R8
 skyAuajqaWVDUenHvrbniRQ76FzxOU61XvCnkBjqa3O+83w7ow7hbVubQ6x12MEllh0JcuoJ0ky
 W5tqTEZEsKVDhBzkTaY6jtG3Fu8VWa0zlNInknLv7ptnSnDeVYvG5Qjh4evIlgflG3/KOu9RBB5
 tvYovqdTRj0BIr6Fwwg1i2bX0853Dh91DYXI=
X-Google-Smtp-Source: AGHT+IFhuc9YoswnVjbx+w6CW5AJc04rjosHA7fJ9MRqxxtRH8l6eukiOU6gxLlrv7CiSglvAulz8g==
X-Received: by 2002:a05:6a00:1491:b0:748:f406:b09 with SMTP id
 d2e1a72fcca58-760367de539mr2440550b3a.23.1753242705935; 
 Tue, 22 Jul 2025 20:51:45 -0700 (PDT)
Received: from ziepe.ca (S010670037e345dea.cg.shawcable.net. [68.146.128.183])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d3190sm8518497b3a.39.2025.07.22.20.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 20:51:43 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ueQW6-0003Fi-CT;
 Wed, 23 Jul 2025 00:51:42 -0300
Date: Wed, 23 Jul 2025 00:51:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <aIBcTpC9Te7YIe4J@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jul 22, 2025 at 10:49:10AM +1000, Alistair Popple wrote:
> > So what is it?
> 
> IMHO a hack, because obviously we shouldn't require real physical addresses for
> something the CPU can't actually address anyway and this causes real
> problems

IMHO what DEVICE PRIVATE really boils down to is a way to have swap
entries that point to some kind of opaque driver managed memory.

We have alot of assumptions all over about pfn/phys to page
relationships so anything that has a struct page also has to come with
a fake PFN today..

> (eg. it doesn't actually work on anything other than x86_64). There's no reason
> the "PFN" we store in device-private entries couldn't instead just be an index
> into some data structure holding pointers to the struct pages. So instead of
> using pfn_to_page()/page_to_pfn() we would use device_private_index_to_page()
> and page_to_device_private_index().

It could work, but any of the pfn conversions would have to be tracked
down.. Could be troublesome.

Jason
