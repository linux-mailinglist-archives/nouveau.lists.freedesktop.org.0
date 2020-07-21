Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7E228304
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 17:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7436E5A5;
	Tue, 21 Jul 2020 15:02:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084B6E5A0
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595343724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSIJqWa6gC/bRdgGTlEg6I1iiFHrJPO8X4/n8B0VJ9k=;
 b=Bw5yZAPpOGCEJuHpW/CojX8OR3hK2Jsxc/n/7A/7sUQe8VGsm2oj7cvWd7lqgNkC/P5lN5
 oOF7jhTJYamd5a4rH89twUhxg/1PeO7yZsERFduV6e7vfcS3JBzOrNCntiUhGf83i6oeZo
 vTBva4+vAaJWntMb6SzDfcuHp6m/ZhY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-cGYH7CaXMlWVk5wJv500Wg-1; Tue, 21 Jul 2020 11:01:58 -0400
X-MC-Unique: cGYH7CaXMlWVk5wJv500Wg-1
Received: by mail-qk1-f197.google.com with SMTP id 1so9368492qkm.19
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 08:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mSIJqWa6gC/bRdgGTlEg6I1iiFHrJPO8X4/n8B0VJ9k=;
 b=IB5dBqi/F3e2KyYAk5vHkLT0UtFAuqurm3BkPjIgK5gZvKKsSrL6PA3CIGISmgEGfX
 Uh+De5xMx9p1KzwZ3oAQ27UVM7yVz/5QTVqSVb6IxfNgSqHQnn9QKFak2mSZckR/i1VO
 /PQC3oS8v65wO4eycNataRg4933v2ek+U2mHvZB73EAjzpQQXm+yr5ZyQu4lNIOINxBZ
 AuiyHE0R2E374YkF7/e8H7T5+5CjMWwQVUW0VuPCK5zB8p2s3If8LWW1cLFMTBTD0KfE
 wjW49pf39SxsclNNf8AEukTll9jp4th7nVMqP9m8W4J8+y9cpsMxdMxxFUvhRpdFYnUh
 PLkQ==
X-Gm-Message-State: AOAM5330HdBr5q9lvFpU3rjSBPgCu9L7y3W9HIr2JzEFwEQD3vvp/6LJ
 XZuuNEMiTygWM/Ti/2mcnvuWnEwSQ+vyMy1chNNHVLvbfeAf89gukZHH/4vVYrHjNq3ySMa8dbS
 e9fUFIBPGbWv+Efqbk2Gt7/xZ6w==
X-Received: by 2002:a37:a51:: with SMTP id 78mr16530753qkk.121.1595343718097; 
 Tue, 21 Jul 2020 08:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJH5IxpTv0tqc1DLQ+iSUR4KYz9tNO0jJWsz8BvtZ9Y/QpYN7MJ20Jq9ljgK+EQmQWXFPL4g==
X-Received: by 2002:a37:a51:: with SMTP id 78mr16530715qkk.121.1595343717650; 
 Tue, 21 Jul 2020 08:01:57 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f4sm22024521qtp.38.2020.07.21.08.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:01:57 -0700 (PDT)
Message-ID: <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Karol Herbst
 <kherbst@redhat.com>
Date: Tue, 21 Jul 2020 11:01:55 -0400
In-Reply-To: <20200721122247.GI5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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

Sure thing. Also, feel free to let me know if you'd like access to one of the
systems we saw breaking with this patch - I'm fairly sure I've got one of them
locally at my apartment and don't mind setting up AMT/KVM/SSH

On Tue, 2020-07-21 at 15:22 +0300, Mika Westerberg wrote:
> Hi,
> 
> [Sorry for the delay, I was on vacation]
> 
> On Fri, Jul 17, 2020 at 01:32:10PM +0200, Karol Herbst wrote:
> > Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597
> 
> Thanks for reporting.
> 
> I'll check your logs and try to figure if there is something we can do
> to make both nouveau and TBT working at the same time.
> 
> > oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
> > once something breaks.
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
