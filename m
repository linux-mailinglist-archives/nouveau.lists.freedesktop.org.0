Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDF187218
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 19:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE096E49A;
	Mon, 16 Mar 2020 18:17:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6C6E49F
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 18:17:09 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m33so15080630qtb.3
 for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2020 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AU4sqxSt8W/YsMvcQ8X78B/FW1vBaCpl1FUzRCmrWTk=;
 b=I9kqfk62E7dF323PFh8XunJgdu4qpFvAS1l8ZUCl9A3tutXPqvJqbKiNe+tj0C59gy
 UvZhzm6L+Jz5auSW0YMh4Vg0v7FYOXZVRAu/O8ObdMAqlJuBwg3DLVpLfshmoOUlVf7h
 cpQdspxu4AQfJGqhUDxSStM+eXObVvC/uIh29hn6KdWAl4c/T4zmpRf1yXWZ2dOFtWpH
 hP7CJ2DDVAigxfpsHWrpdwyo/lwkqS4ojrnmbxom8dGEOjRhtpaC8taoW6+yOvvHDlZq
 4Jbtk6mowDdh1CCy3Nz3yEpp7X0Ml+vcVwbFmHaDPFmmHRa9qVw2l0UQ2c8gxyhWQGTb
 8NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AU4sqxSt8W/YsMvcQ8X78B/FW1vBaCpl1FUzRCmrWTk=;
 b=rq8KuZi4AnlZoq4P0/AwmZ/4reEXr05yGmLVnFXSPqzmXv+pmOpP5NoMZ7sBTq1Fyj
 JcAsx8sUJBPftoB80fN6Ts/POt1iJTeGvIUQIllwxLVHPNZsAUG3q9DX7jU3SpbeOWuA
 8teQ442uw2nI5C4f8oAuMyrX0D6MvJgvxrVXtR+FOyFvoejbHAvQxE4Gc1ceBX9ZpbVs
 MeWpADfoLseedjJKbKA/z/tYS2Mo3WiQBl3knQHqGcmydcBP2rocRJrzbN8EYeNBBZxo
 cAdT5Wttp3JIYQHhzUnz0UrJdHUQe9X/gI06XhAUOnutfZHr9MQg5x+ttQfhIbxYbpZH
 W0dQ==
X-Gm-Message-State: ANhLgQ0ty4C/eFggpIWuTFVd87VOFL0JAnp7hiHQ+odrahwT2VfpV9kx
 jJ08D6OW8brXgwfFTlwR0ddkXw==
X-Google-Smtp-Source: ADFU+vufKXH4Rg2LSzA+eIE14Uk1GaxDUelHZyHwAwMBTplSLIhENSdd8YqSQW0Vquak3WGfZNoxUw==
X-Received: by 2002:ac8:6d19:: with SMTP id o25mr1435634qtt.303.1584382628623; 
 Mon, 16 Mar 2020 11:17:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id l4sm297388qkc.26.2020.03.16.11.17.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 11:17:08 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDuIV-0005TT-IP; Mon, 16 Mar 2020 15:17:07 -0300
Date: Mon, 16 Mar 2020 15:17:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200316181707.GJ20941@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316175259.908713-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 1/2] mm: handle multiple owners of device
 private pages in migrate_vma
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 06:52:58PM +0100, Christoph Hellwig wrote:
> Add a new opaque owner field to struct dev_pagemap, which will allow
> the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> and refuse to work on mappings not owned by the calling entity.

Using a pointer seems like a good solution to me.

Is this a bug fix? What is the downside for migrate on pages it
doesn't work? I'm not up to speed on migrate..

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
