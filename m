Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287531509F
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 14:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394B96EB40;
	Tue,  9 Feb 2021 13:44:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CEC6EB40
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 13:44:41 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id o21so4035565qtr.3
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m0aWzSj+LY+Pm6/iOhWj1FnuzMBYaB0PeiOpmIEzYlc=;
 b=m0ZybclIto8FDXMo+Xc6M8LWQUVcr4Fdfd7ghcLIyxKTwH8BTQxyYtMUbUih8tWECV
 2VT+6s7hE8CBSiZqN6bkvw24Uac8MmLDDi12B1jeZRjtOHllqcD/cupL4eo+uhYRxZN2
 XofmcdPW3z+B4YCZnjGgWp75JMipYH0r7LH38gPu9CVXeJXQ4b1p3ExIpExO2Iz18RiX
 aSE40sCfQ2T9u25TW9dPn2rmDnvbpisbwQQGBqLSCL+xzXgXzET0NMzRjKIe/+v41lcz
 06dZa8ip1rgW6T8XpAe3Ap1llZSkK/tUofjeynu9J8T6nOGeeaa6PrERHkyYyDfqrS/d
 Uv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0aWzSj+LY+Pm6/iOhWj1FnuzMBYaB0PeiOpmIEzYlc=;
 b=RBVx9VJgYCTlQJMIkLWhTecORPcSXNDmvhDw2zbdHqlxfsEYB5pjvbCbFeJ9v1AENo
 gNT1RnBphoFPeMzxUN/T5gWV+4Xr5w8LSujApe/8NYopmOeiD6Qw3AhxUevtX+K1pVkq
 FSo9t+gpV4EBbCwXyX0xmxOzKqwYks1ytaaPMeA1Vmle+fxuEN/WN7rFXYhunaS0iKXI
 le+SL/5xlfsIug44oK5kXEVPSS7bBwF4jEtqZHGrGnWdpWNM8XJeeke51GKi6AwXTcZA
 MZe8VUdOIp8h0/YJfpYpAbZ5lv1D7nuPIrTEJ+4dp8AdfRHTl9OB0GRdcesSV0ZkUsib
 KCaQ==
X-Gm-Message-State: AOAM532Z1tAs5TOK4GB9F4UNmlWyoBoXn39XvydefHRebcnqOHWK/zTZ
 0X2NjFvjBm9Q1CYOfUYrM9sAng==
X-Google-Smtp-Source: ABdhPJxsSPzRdXtHpbbQb8PSJ12WAOa9MW0LcEJBQn0Vx0sdyHcridZpcWDX5XcVOrwu+wtw66I+OA==
X-Received: by 2002:ac8:1190:: with SMTP id d16mr19704724qtj.125.1612878279800; 
 Tue, 09 Feb 2021 05:44:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id t6sm14169555qkd.127.2021.02.09.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:44:39 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9TJm-005RQR-Sq; Tue, 09 Feb 2021 09:44:38 -0400
Date: Tue, 9 Feb 2021 09:44:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210209134438.GE4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian> <20210209133520.GB4718@ziepe.ca>
 <CAKMK7uGR44pSdL7FOui4XE6hRY8pMs7d0bPbgHHoprRG4tGmFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGR44pSdL7FOui4XE6hRY8pMs7d0bPbgHHoprRG4tGmFQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 0/9] Add support for SVM atomics in Nouveau
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 02:39:51PM +0100, Daniel Vetter wrote:

> Either way ZONE_DEVICE for not vram/device memory sounds wrong. Is
> that really going on here?

My read was this was doing non-coherent atomics on CPU memory.

Atomics on GPU memory is just called migration to GPU memory, it
doesn't need to be special for atomics. In that case it can free the
CPU struct page completely as the data now lives in the ZONE_DEVICE
page so no need for a pin, no problem with movable

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
