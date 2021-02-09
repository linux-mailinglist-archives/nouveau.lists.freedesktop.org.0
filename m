Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38331506B
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 14:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76186EB36;
	Tue,  9 Feb 2021 13:39:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CFE6EB36
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 13:39:35 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id h8so7644632qkk.6
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q4gBt83LBvEvfgqjMk5XxBqoQUgJu0Updm2eupI2oTY=;
 b=aQhoXa9jPalDWlVkfGxPk+c+I0Q9JZFKo47tCsmclHZEsPNYfreM817gCFAr4kOU8W
 fHBrAIQilQhVmk1iG9w5EWskZgjnukqG4cUDzLNZ6BylHXqnGvwuThK4UN4InIuRH/ze
 cvAS/4B/aBNt8AOe4VR/tiAtWA123wCajp47c9XzIXZFa0/I9e6/nmkjO6l7O80x9iCT
 kP9CrF06fB0beIFQO/9dbuqk7hvLl+4qLhMBYJj+SEwVoqE/HfXTlsjgBKUF7reYwTlf
 Ov9fDvgK+9WKyztUGrdI96zt7nHKT/h6nbpz8LPo9nETq4dWfycOqz7C26v5rJTgWElw
 YGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q4gBt83LBvEvfgqjMk5XxBqoQUgJu0Updm2eupI2oTY=;
 b=T4luR0oYfIKmVSXzvVzb1CjrEnqBg9sbKnvPDIanErBkOiA/gFGcWblHENAZVqBRR8
 Dp48ae/nwZXXhYNKzVsoXRrOGZt7D+Oi6rrOPJzSJlSFwtngOvh1LB4jg7YolhhJDyZ1
 Dyglzj4wmjAvX8XUhOwHzDKeYlImY8SXRfdRblmTTX4okYHK+fGVwVuKk3K9dTZcXLFw
 JhWUjSVCvVykuVk4GaLNZKpQQOehs49eH5yN+XiS8ESsj55N/kV9UHs0OCs5uAAu4fF0
 h5HUzuaCgWRb1Fa2TRHXVWqIkwFXQnLdPGE19K8dwQdsfMmjRPsUlDa/de1XnnDgyrR6
 Uh1w==
X-Gm-Message-State: AOAM530xStgRojRQRjx+p4CnzrJao75EunZQbnuWaFNk44E9VY6lJvLC
 W7h572YwxBoswo5tux+1KCLvOA==
X-Google-Smtp-Source: ABdhPJzETc8qT6BXd1BDQmX3B26rXpyj1TrCOmYb4Fqo0JHFF6LTk7HRkfK/22tofKGhVc50wAK02g==
X-Received: by 2002:a37:5a45:: with SMTP id o66mr21362019qkb.446.1612877974387; 
 Tue, 09 Feb 2021 05:39:34 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id m21sm17197217qtq.52.2021.02.09.05.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:39:33 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9TEq-005RKt-Q3; Tue, 09 Feb 2021 09:39:32 -0400
Date: Tue, 9 Feb 2021 09:39:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210209133932.GD4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210209010722.13839-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209010722.13839-2-apopple@nvidia.com>
Subject: Re: [Nouveau] [PATCH 1/9] mm/migrate.c: Always allow device private
 pages to migrate
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 bskeggs@redhat.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:07:14PM +1100, Alistair Popple wrote:
> Device private pages are used to represent device memory that is not
> directly accessible from the CPU. Extra references to a device private
> page are only used to ensure the struct page itself remains valid whilst
> waiting for migration entries. Therefore extra references should not
> prevent device private page migration as this can lead to failures to
> migrate pages back to the CPU which are fatal to the user process.

This should identify the extra references in expected_count, just
disabling this protection seems unsafe, ZONE_DEVICE is not so special
that the refcount means nothing

Is this a side effect of the extra refcounts that Ralph was trying to
get rid of? I'd rather see that work finished :)

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
