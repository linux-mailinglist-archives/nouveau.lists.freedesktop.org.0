Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D219318E142
	for <lists+nouveau@lfdr.de>; Sat, 21 Mar 2020 13:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CE16E320;
	Sat, 21 Mar 2020 12:38:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681206E356
 for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2020 12:38:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 10so7540531qtp.1
 for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2020 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g+X9axIFKiWeeLdgLNKPr3c4V/oqgekJuwFhbkyQ++0=;
 b=YDGwjbkAmGbRPiuztvMLIJR+RwawI4R9lJXPH7QbDer2L1eqjxZOfSzYRCCj4dQ5h8
 LNYL0Qb6QIV4gt87dOC0YK5+NDHpJGtkgCpJBFSFWnHUJCpL6bA/zH6X2PbD4oba5F9X
 4lF2ePGxbLhqL7Avh2Kbh5MuaD//GpzLoKkm1KR91LzlOKe5zf8jp3fXJVkuXqFT0LLH
 i/29ilqiHUkbjkkIoZmdWorukI0/POVB5ozTft4Y6Cw9/PlM+vmj2AY/0dCrZCVNzgv4
 H8QgXPaP1swxfNMMnqoy+V3apr+4E00PTyGnIvPuh+MDi0XALGpCfRy6FNa8JnL1/fVU
 GasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g+X9axIFKiWeeLdgLNKPr3c4V/oqgekJuwFhbkyQ++0=;
 b=k8BLNddBUUh5fIczODYNhZe/cffTO4XHOIW+uZrMb+C7Fn8Ptp3KQnunxj8CbpaVLm
 81CwFbEdljTeMaIV3MEks8hgjikOPm8NLKcpabY6J2nixFvyVAyGKOc/E1oc0mvbqz/3
 k8OFqjBk54CfMOSI21Aw9E1eDIdgt2cy+Mfk2/hvdCCpIDtvx8DIzk+6wOZcQDaS0dFn
 gVUHmnUyB0YJzyKl6bjursJjzHGkomDc8+QHJWJXuZ2paqYcSsX+uw86qqOS+akm0Rga
 dPAleSqK7+5TcnUnjjiMYYbPQ0eZk2eRdB8cW3atowF+/JBYc8vziXxB+gi6EETIvexZ
 vRUQ==
X-Gm-Message-State: ANhLgQ2yP9fuLoKfREjInSPD3Rqb+kiRIL1FZnHEnByBcd5fIy4+9+K9
 BS+YH4UNFbu3yQzogE/OintXlg==
X-Google-Smtp-Source: ADFU+vszEC65qtGCdETefXI+dh5dGaMDFaODrGKKrJmVGUsFuszKPiaO8AXtfztZJoZUFwabBOS2GA==
X-Received: by 2002:ac8:b8d:: with SMTP id h13mr13019242qti.298.1584794285323; 
 Sat, 21 Mar 2020 05:38:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u40sm7435378qtc.62.2020.03.21.05.38.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 21 Mar 2020 05:38:04 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFdO8-0008OQ-7G; Sat, 21 Mar 2020 09:38:04 -0300
Date: Sat, 21 Mar 2020 09:38:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200321123804.GV20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
 <20200320134109.GA30230@ziepe.ca> <20200321082236.GB28613@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200321082236.GB28613@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 4/4] mm: check the device private page owner
 in hmm_range_fault
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

On Sat, Mar 21, 2020 at 09:22:36AM +0100, Christoph Hellwig wrote:
> On Fri, Mar 20, 2020 at 10:41:09AM -0300, Jason Gunthorpe wrote:
> > Thinking about this some more, does the locking work out here?
> > 
> > hmm_range_fault() runs with mmap_sem in read, and does not lock any of
> > the page table levels.
> > 
> > So it relies on accessing stale pte data being safe, and here we
> > introduce for the first time a page pointer dereference and a pgmap
> > dereference without any locking/refcounting.
> > 
> > The get_dev_pagemap() worked on the PFN and obtained a refcount, so it
> > created safety.
> > 
> > Is there some tricky reason this is safe, eg a DEVICE_PRIVATE page
> > cannot be removed from the vma without holding mmap_sem in write or
> > something?
> 
> I don't think there is any specific protection.  Let me see if we
> can throw in a get_dev_pagemap here

The page tables are RCU protected right? could we do something like

 if (is_device_private_entry()) {
       rcu_read_lock()
       if (READ_ONCE(*ptep) != pte)
           return -EBUSY;
       hmm_is_device_private_entry()
       rcu_read_unlock()
 }

?

Then pgmap needs a synchronize_rcu before the struct page's are
destroyed (possibly gup_fast already requires this?)

I've got some other patches trying to close some of these styles of
bugs, but 

> note that current mainline doesn't even use it for this path..

Don't follow?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
