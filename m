Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE459E833
	for <lists+nouveau@lfdr.de>; Tue, 23 Aug 2022 19:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098410E0ED;
	Tue, 23 Aug 2022 17:05:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95A10ED4E
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661274317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8p2uyAKXgw2ytHTuc+5AiV01x8sZyv3wGpjT1yNESQ=;
 b=LkTNp2iw44Bu03D1Sz80LGVKuuS80Cjw7ssAyiOXcwU7r9LlOkLbVAhBsz1ZKjtptrG5gJ
 DxkMd/k18jMok3KH64UhpX84KjMTmUG0lsMmpBlYKv2vxVzUTI/bPrNIHRL6VRqDqQg7Eq
 0Ab7QtzzYXhrpgz+XF2QSJkC0yiasWk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-a6UEFhxKOEePmJBuXyn-Gw-1; Tue, 23 Aug 2022 13:05:13 -0400
X-MC-Unique: a6UEFhxKOEePmJBuXyn-Gw-1
Received: by mail-qv1-f72.google.com with SMTP id
 c10-20020a0ce64a000000b00496b34088f3so7876820qvn.15
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 10:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=B8p2uyAKXgw2ytHTuc+5AiV01x8sZyv3wGpjT1yNESQ=;
 b=3r7CivZOe90TR4Q2oqxFLasSHYk/dxfkT+NKD38Bc2+NDYI5JkE6pbrO56owKdnWiG
 fsqqzwHXTCZv2PjioBrc9AHTogDSnMFIBKfi6QjmLB2VMq+SRNi/tHU4cvV/ttJqmvzt
 PD7mPnkHWtU9k4pUKDMdvV/YnWUgLxREP0gmyl3UOATTK6mk7qKHZRcFDIPcxAw+/3kE
 ufbJxw2FlIw6ohzgUkynGFICMrep6JIlKGy287d7KmDaWWnCpSOM566HSeUct9Mu5EDm
 2HLdWl/7F9qD1I20dSctDIP4qqI/eb2KKXTZzvijoLdBFBDl3wQBMQLwhwoYDUPH4MTQ
 Y3Zg==
X-Gm-Message-State: ACgBeo2BRbc2csppD2B0Gig+ep6+czt0ZAkbsmcTpzDhuZmcoefvDMEx
 Se22ld5rgSIg1mc2HYUJdiF55ro1+x5t8Dap6nLYihAWgPtav7YyLRGCPCakyIgcGIq/gbXMlli
 NhypLwUtj4ABCRsg+OKNgdonUdQ==
X-Received: by 2002:a05:620a:258a:b0:6b6:641c:9e8b with SMTP id
 x10-20020a05620a258a00b006b6641c9e8bmr16600830qko.82.1661274312950; 
 Tue, 23 Aug 2022 10:05:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5VzbZNjrVAgx+HYzqS7GNBWoc3UPU2Kb8TYsavXfFP9Ffx8P2stAafh7ymp52PM9Yl4vhjCw==
X-Received: by 2002:a05:620a:258a:b0:6b6:641c:9e8b with SMTP id
 x10-20020a05620a258a00b006b6641c9e8bmr16600803qko.82.1661274312625; 
 Tue, 23 Aug 2022 10:05:12 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 fb24-20020a05622a481800b003434d1a7a14sm11086541qtb.62.2022.08.23.10.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 10:05:11 -0700 (PDT)
Message-ID: <54f3e05187c4e923b3a746beff3be4071ed0f2e1.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 23 Aug 2022 13:05:10 -0400
In-Reply-To: <CAAd53p6dTdWzkiyH6Sz=YubhdibvGa4hZ+EPN7mZA4aYSPd_6g@mail.gmail.com>
References: <20220819142519.5684-1-mario.limonciello@amd.com>
 <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
 <c10b243a7be185ba119bdfce9a46e609db3bdd3b.camel@redhat.com>
 <CAAd53p6dTdWzkiyH6Sz=YubhdibvGa4hZ+EPN7mZA4aYSPd_6g@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [RFC 0/2] Stop the abuse of Linux-* _OSI strings
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
Cc: ddadap@nvidia.com, hdegoede@redhat.com, rafael@kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Aaron Ma <aaron.ma@canonical.com>, Dell.Client.Kernel@dell.com,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 2022-08-23 at 11:47 +0800, Kai-Heng Feng wrote:
> [+Cc Aaron]
> 
> On Tue, Aug 23, 2022 at 5:18 AM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > On Fri, 2022-08-19 at 17:44 +0200, Karol Herbst wrote:
> > > On Fri, Aug 19, 2022 at 4:25 PM Mario Limonciello
> > > <mario.limonciello@amd.com> wrote:
> > > > 
> > > > 3 _OSI strings were introduced in recent years that were intended
> > > > to workaround very specific problems found on specific systems.
> > > > 
> > > > The idea was supposed to be that these quirks were only used on
> > > > those systems, but this proved to be a bad assumption.  I've found
> > > > at least one system in the wild where the vendor using the _OSI
> > > > string doesn't match the _OSI string and the neither does the use.
> > > > 
> > > > So this brings a good time to review keeping those strings in the kernel.
> > > > There are 3 strings that were introduced:
> > > > 
> > > > Linux-Dell-Video
> > > > -> Intended for systems with NVIDIA cards that didn't support RTD3
> > > > Linux-Lenovo-NV-HDMI-Audio
> > > > -> Intended for powering on NVIDIA HDMI device
> > > > Linux-HPI-Hybrid-Graphics
> > > > -> Intended for changing dGPU output
> > > > 
> > > > AFAIK the first string is no longer relevant as nouveau now supports
> > > > RTD3.  If that's wrong, this can be changed for the series.
> > > > 
> > > 
> > > Nouveau always supported RTD3, because that's mainly a kernel feature.
> > > When those were introduced we simply had a bug only hit on a few
> > > systems. And instead of helping us to debug this, this workaround was
> > > added :( We were not even asked about this.
> > > 
> > > I am a bit curious about the other two though as I am not even sure
> > > they are needed at all as we put other work arounds in place. @Lyude
> > > Paul might know more about these.
> > 
> > Some of the _OSI strings are totally fine. From my recollection:
> > 
> > [    0.242993] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> > ^ this one is needed to do a couple of ACPI tricks at startup to get the PCIe
> > device for audio on nvidia's GPU to be detected properly
> 
> This should be fixed by commit b516ea586d71 ("PCI: Enable NVIDIA HDA
> controllers").
> Aaron worked on more Lenovo systems than me, so he may be more sure of it.
> 
> > 
> > [    0.242993] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> > 
> > I don't actually know how necessary this is, but I'm hesistant to call this
> > one bad as it may be related to the funny mux configurations that I'm learning
> > may exist on HP machines.
> 
> Should be fixed by commit 8e55f99c510f ("drm/i915: Invoke another _DSM
> to enable MUX on HP Workstation laptops").
> 
> And for "Linux-Dell-Video", it should be fixed by 5775b843a619 ("PCI:
> Restore config space on runtime resume despite being unbound").
> 
> So actually I am in favor of removing them all.

Woo! Thank you for the help with this :3. Since this all seems to be in order:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> 
> Kai-Heng
> 
> > 
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

