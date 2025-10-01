Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60DBB1766
	for <lists+nouveau@lfdr.de>; Wed, 01 Oct 2025 20:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D7710E740;
	Wed,  1 Oct 2025 18:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ECe3krGz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FF310E740
 for <nouveau@lists.freedesktop.org>; Wed,  1 Oct 2025 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759342596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hl5yRJD3IkUvsBwDHH8M7CQ5CZxrZ7ikFZVETEwQEng=;
 b=ECe3krGzwzP1B7Kr8xjRlPUci9AfsZ7ECri3dpAoxQELgwVOGbo3e/6EWdsF9YdB3zg5pT
 oUn19ChMfV40xGFNT3LOWffiC+yIPWR9uPxZ7nK1R5oRZj/5A+m21NuC0lYfAUmA45OrH7
 Q/jyxUXpW5+be6JTxOLMW6QcmKiYnq4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-C3dSqWVANHirfqj-Ipa0bQ-1; Wed, 01 Oct 2025 14:16:35 -0400
X-MC-Unique: C3dSqWVANHirfqj-Ipa0bQ-1
X-Mimecast-MFC-AGG-ID: C3dSqWVANHirfqj-Ipa0bQ_1759342595
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-4257e2f44e9so301815ab.3
 for <nouveau@lists.freedesktop.org>; Wed, 01 Oct 2025 11:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759342595; x=1759947395;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hl5yRJD3IkUvsBwDHH8M7CQ5CZxrZ7ikFZVETEwQEng=;
 b=oukqRqemc2QVNB7h9seMVa16KdckgEE+H34M5ADrewTUHadYSyqY1ICe6qgqAJOmtZ
 3stS7Q+k7gWjfV0/SxgdBlXN4b7crgBcHUaZhHnTKO/PXaLvGyr9Uf95kncLd2uiq41Q
 5TM6QUzdQJ9tHLanww0QcAMsCNiikKHHCqKYpa0vZ/X+rtMZN9ijIQcAgF58OoPEX0CR
 j9m8a1zsVCpLOKA5qJYBmV5DWgcDM5XyPn4jYHk/r0hwV08eODX9Px/uKkDR74ZHLwUS
 QBAmOSXL9yzwEDBxmohU0oBMk4ny5LBMdc0nUemEK4QTrXXkO48qEu27PHYSzeqBJl7M
 Cq5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNsVV+TlRBonsbP7vgUoJxU99G4audpn1BF/aRQYXRH87lhNR6EXKm2pz+eTF/eAiqqh0io6NJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7tmpO88YA2rD2p4bflrAAHY+ioenSi46yk5yz3ilSEE388dkn
 xmNLXwZpOCJi3QYHoSid+CdnmgOJNRp+zGuOV/wJZ/dOgEQrevUZTeGzrvxYquSLUvwMS7FrFAu
 NtmaKqHJewyqmpWtYF+k9JRx5kHImJ89bQTM8SEYEZ96XApdlFW+Vgr/hug1RNHvzpN4=
X-Gm-Gg: ASbGncvNnK/iS39RliWrFHYpEmwa2gPGtOD7luEIsEE8EB6xh3RmCz5CwkWvteO3L14
 JEB421P6AJQqseF3tWcq+MsTPRhoDSgVdXIy9vYVrsWvT3hFFDtOmb983aznihMrlzeLhsrQ5Vn
 oRTJkMyXOn6sgx1WhFfOoqnIVldcEzDVbLProGEqsxjVhwrL2cXGcrPhYS4MzEsh0+EOfXJfwJJ
 scmRtsCuRUj2K8BMraBVaJ7clafMWoIdn//XU2iZr23ApgdWt7hJPQzmGBq0dSJPLwFFgUz2HWY
 QyHiJn8wYcCGB4857JLnr9nVtbaP7LUteUsriZk+KNHXYjAK
X-Received: by 2002:a05:6e02:156a:b0:427:8d45:a545 with SMTP id
 e9e14a558f8ab-42d8167ffcbmr26826695ab.6.1759342594752; 
 Wed, 01 Oct 2025 11:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz1/E65PrFu+RbIoFX/NgQBsZUTxT4dfgeMXQ472VKwtzi9DsWrZBCgFVcbSRmX9luhz8ANQ==
X-Received: by 2002:a05:6e02:156a:b0:427:8d45:a545 with SMTP id
 e9e14a558f8ab-42d8167ffcbmr26826495ab.6.1759342594322; 
 Wed, 01 Oct 2025 11:16:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-57b5e9ec3afsm62945173.5.2025.10.01.11.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 11:16:33 -0700 (PDT)
Date: Wed, 1 Oct 2025 12:16:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Surath Mitra
 <smitra@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
Message-ID: <20251001121631.7f2e68f5.alex.williamson@redhat.com>
In-Reply-To: <20251001144629.GA3024065@nvidia.com>
References: <20250930220759.288528-1-jhubbard@nvidia.com>
 <DD6K5GQ143FZ.KGWUVMLB3Z26@nvidia.com>
 <fb5c2be5-b104-4314-a1f5-728317d0ca53@nvidia.com>
 <20251001144629.GA3024065@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ywBBaCDs_hS8j3PuP-FcpZkc_RLJuaEfgq6qBCkeeZo_1759342595
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 1 Oct 2025 11:46:29 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 30, 2025 at 06:26:23PM -0700, John Hubbard wrote:
> > On 9/30/25 5:26 PM, Alexandre Courbot wrote:  
> > > On Wed Oct 1, 2025 at 7:07 AM JST, John Hubbard wrote:  
> > >> Post-Kangrejos, the approach for NovaCore + VFIO has changed a bit: the
> > >> idea now is that VFIO drivers, for NVIDIA GPUs that are supported by
> > >> NovaCore, should bind directly to the GPU's VFs. (An earlier idea was to
> > >> let NovaCore bind to the VFs, and then have NovaCore call into the upper
> > >> (VFIO) module via Aux Bus, but this turns out to be awkward and is no
> > >> longer in favor.) So, in order to support that:
> > >>
> > >> Nova-core must only bind to Physical Functions (PFs) and regular PCI
> > >> devices, not to Virtual Functions (VFs) created through SR-IOV.  
> > > 
> > > Naive question: will guests also see the passed-through VF as a VF? If
> > > so, wouldn't this change also prevents guests from using Nova?  
> > 
> > I'm also new to this area. I would expect that guests *must* see
> > these as PFs, otherwise...nothing makes any sense.

To answer this specific question, a VF essentially appears as a PF to
the VM.  The relationship between a PF and VF is established when
SR-IOV is configured and in part requires understanding the offset and
stride of the VF enumeration, none of which is visible to the VM.  The
gaps in VF devices (ex. device ID register) are also emulated in the
hypervisor stack.

> > Maybe Alex Williamson or Jason Gunthorpe (+CC) can chime in.  
> 
> Driver should never do something like this.
> 
> Novacore should work on a VF pretending to be a PF in a VM, and it
> should work directly on that same VF outside a VM.
> 
> It is not the job of driver to make binding decisions like 'oh VFs of
> this devices are usually VFIO so I will fail probe'.
> 
> VFIO users should use the disable driver autobinding sysfs before
> creating SRIOV instance to prevent this auto binding and then bind
> VFIO manually.
> 
> Or userspace can manually unbind novacore from the VF and rebind VFIO.

But this is also true, unbinding "native" host drivers is a fact of
life for vfio and we do have the sriov_drivers_autoprobe sysfs
attributes if a user wants to set a policy for automatically probing VF
drivers for a PF.

I think the question would be whether a "bare" VF really provides a
useful device for nova-core to bind to or if we're just picking it up
because the ID table matches.  It's my impression that we require a
fair bit of software emulation/virtualization in the host vGPU driver to
turn the VF into something that can work like a PF in the VM and I
don't know that we can require nova-core to make use of a VF without
that emulation/virtualization layer.  For example, aren't VRAM
allocations for a VF done as part of profiling the VF through the vGPU
host driver?  Thanks,

Alex

