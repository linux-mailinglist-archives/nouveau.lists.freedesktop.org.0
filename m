Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF822846B
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 18:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5A6E447;
	Tue, 21 Jul 2020 16:00:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DDD6E424
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595347254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0UrEz/GvXR1ZZ5iVqJP3qWd7bx+Q5rlrTYnl3WPpZ0=;
 b=i8Qu/OYQZkaq1Irfx0chJjTxyFvUK0hIK32enmue9E2SVCq/O5k2JrNARdI/PTWxPxOmBk
 JOwnJiINoMEWI+1OEJa2oppSvlf7XuwnA3aXmaWht5w3rbTitzc7KD/LQIUojHAfT18L5M
 LL3+Sxodvt46qE5nDhzLHBGW/5ddrso=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-uCns5hvaMV6TXs0DbJ60-Q-1; Tue, 21 Jul 2020 12:00:52 -0400
X-MC-Unique: uCns5hvaMV6TXs0DbJ60-Q-1
Received: by mail-qv1-f69.google.com with SMTP id x37so12672219qvf.4
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=P0UrEz/GvXR1ZZ5iVqJP3qWd7bx+Q5rlrTYnl3WPpZ0=;
 b=ilyFyBBdjpc+OFsq4wqGE6gMYP3GNvQGLfER7q1OntcBeEtGpVFZAvhY30wra/1Sfj
 m+vqIm89vcWWFm30+augHy5Y7Vznk3KFYu07MxGSqPjWfjKfcgv6+E7EkANz33+tJKEw
 Fm0qytQCp09lUCku0MwPqTb7bA2PiIONiDuDSzAr9ELrhZ5taVTu7wAMwjF/Vx5DOxEf
 sAHGK5m2oX28lHMqlx7mJ+OTmIuE5Aalayv3lR4/H4Wr2f4g08+FJGCzm/Qkg6XmA6rR
 1kQkHi+wjB8Jhfe+FEdq/2JpmIO6nDcv2GMqPFO8V6qFhxeIhJH9MEUqLbI2CdRd23sO
 JxSg==
X-Gm-Message-State: AOAM530UjfWtB4gvC7cIMxXqq8ZB/458alWJ/8YXAgKTKa2CCe86zSF/
 BRjlseCm08dtuRK0budGZIsLWm7uAFEcN4QigrxpOpaY7Yx3Pnlizz0CQS/EW1DW+BfvZ5PRerb
 VAzyJ3mEZAi07IbMRaJ/vAHWuFA==
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr12959433qkg.326.1595347252175; 
 Tue, 21 Jul 2020 09:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyinIbVabueGMXoafK8P3B2fbzczvS1OyYVVhBZSVm9JqHV5WA7XsG5FVGYoO3j+1QlROT9pw==
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr12959408qkg.326.1595347251931; 
 Tue, 21 Jul 2020 09:00:51 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x29sm21891103qtv.80.2020.07.21.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:00:51 -0700 (PDT)
Message-ID: <dc7a592219f58f9a5df7fa7135fa3fc87d9450f0.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue, 21 Jul 2020 12:00:49 -0400
In-Reply-To: <20200721152737.GS5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau regression with 5.7 caused by "PCI/PM: Assume
 ports without DLL Link Active train links in 100 ms"
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 2020-07-21 at 18:27 +0300, Mika Westerberg wrote:
> On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > Sure thing. Also, feel free to let me know if you'd like access to one of
> > the
> > systems we saw breaking with this patch - I'm fairly sure I've got one of
> > them
> > locally at my apartment and don't mind setting up AMT/KVM/SSH
> 
> Probably no need for remote access (thanks for the offer, though). I
> attached a test patch to the bug report:
> 
>   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> 
> that tries to work it around (based on the ->pm_cap == 0). I wonder if
> anyone would have time to try it out.

Will give it a shot today and let you know the result

> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
