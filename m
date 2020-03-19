Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45618BFA6
	for <lists+nouveau@lfdr.de>; Thu, 19 Mar 2020 19:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6D6EA5D;
	Thu, 19 Mar 2020 18:50:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C286EA5F
 for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2020 18:50:18 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l13so2772255qtv.10
 for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2020 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+iQmmyqtxCtarJ4YRBKb0yWGqnthI8hUUC43IFJE2lc=;
 b=O+T+k7QcGsKIEHBjgipyL31XPaNddanzbawgGU863gdvDPNIX7LYi3WVs/mOCkQatM
 kp3xPR0l9A+vuyX750Q+3/7jJVu4icOVMoEC/ohdQ5GVvA3ARolXe4ZZVnWtakCYOGal
 boy4qnC1A6on3cpFaP6DgucabbLC6sHg+E7Qo7m9ag0aas++wv/SLWln/6E5qDazux78
 cdzi7JujpLBWCBJqNIB5d7eOJ93n7akLN+Ctr6uYuANCJPwzugp1TU5/0Zr3jU0FqhYQ
 5GF51y82KW0QITwSWN2Y1KbEajR7yA6aP5DQTQFmk2rLd5pBravF6IH6lq8HScNN4zv7
 xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+iQmmyqtxCtarJ4YRBKb0yWGqnthI8hUUC43IFJE2lc=;
 b=dSFZJR4O+Zuv6ymaMYADF0/1BcgymAV+b7xQ2YC0Bhb+M76qx2TkjeprYiraXQV6zw
 f4M7WbsQPRzjkogVOA+o4ad0/lBo63C8wsW+tWS1nxishVRSvhrNKU2IrpuxX92Y79DP
 L38mn3OX2NNguvG9AMIWlNRJ2oOzUTl9EokYxST+IFcejAy1/KCJ4TWc36BRdemn3ZYo
 gagiV3q0LAM1BzNER542BLc4Qc9rXbL2nDqRMidjMv3jENIA34//Sr+yeY57WwZmjINU
 tI668YvtwqyOAnAt40fh9iTqZcMlgj7nzNSskdmZ+ZR5UA7wiL1m9g0qMtfXIL5vWdao
 Bzbw==
X-Gm-Message-State: ANhLgQ1sIHXW5JoRCG4apSnmiNoR+BJysfZxQevJlwRnWv+Zh0rNc0En
 5NmplNY5wbN7VDrExK1bf7RxJg==
X-Google-Smtp-Source: ADFU+vvq32in5Qjs8YAHdFEpYAPgT41J1WfLa2uHLd4XxlB1EmISPkcd3J2y54DRcA2TER5nFwTi4A==
X-Received: by 2002:ac8:4548:: with SMTP id z8mr4613857qtn.188.1584643817615; 
 Thu, 19 Mar 2020 11:50:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 82sm2177475qkd.62.2020.03.19.11.50.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 11:50:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jF0FD-0004NT-Vw; Thu, 19 Mar 2020 15:50:15 -0300
Date: Thu, 19 Mar 2020 15:50:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200319185015.GM20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200319002849.GG20941@ziepe.ca> <20200319071633.GA32522@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319071633.GA32522@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] ensure device private pages have an owner v2
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

On Thu, Mar 19, 2020 at 08:16:33AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 18, 2020 at 09:28:49PM -0300, Jason Gunthorpe wrote:
> > > Changes since v1:
> > >  - split out the pgmap->owner addition into a separate patch
> > >  - check pgmap->owner is set for device private mappings
> > >  - rename the dev_private_owner field in struct migrate_vma to src_owner
> > >  - refuse to migrate private pages if src_owner is not set
> > >  - keep the non-fault device private handling in hmm_range_fault
> > 
> > I'm happy enough to take this, did you have plans for a v3?
> 
> I think the only open question is if merging 3 and 4 might make sense.
> It's up to you if you want it resent that way or not.

Okay, I kept it as is and elaborated the commit messages a bit based
on the discussion

It doesn't seem like the changes outside hmm are significant enough to
need more acks

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
