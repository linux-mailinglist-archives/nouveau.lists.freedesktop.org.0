Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5F52C10F
	for <lists+nouveau@lfdr.de>; Wed, 18 May 2022 19:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12289113EBB;
	Wed, 18 May 2022 17:42:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790FE113EBB
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652895751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R10Pn13jNl8HCvMzbA+apZgu0eeQPdX85bCUFP7rHE8=;
 b=JHkumd3GN8aBPNWqLD3fD+UNUx42KCTYwp5vz9gDKi+j/zIlgrKtPJLAZS15qp5ri85EnD
 IA/yiBbIPQoJZ7UfjnHLf5DUcQw3kcmrpjMsqNgkMLtXWb7xyd6lCn7wCa4mmnGHTbTZa7
 RziE97czxXmmEzrleCtrLbwjuKJSv6w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-P-w-heTzN_WHXjFnQHNi2Q-1; Wed, 18 May 2022 13:42:30 -0400
X-MC-Unique: P-w-heTzN_WHXjFnQHNi2Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 ck16-20020a05621404d000b00461bcafbbe9so2112623qvb.23
 for <nouveau@lists.freedesktop.org>; Wed, 18 May 2022 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=R10Pn13jNl8HCvMzbA+apZgu0eeQPdX85bCUFP7rHE8=;
 b=NWViSQmr3n8HoUTKoTp8rrL7ZWQ8QPbK99GnRs2+32DtUSqfu+2jCyprcr0MygbMii
 /IPMI+el/YFNShFqet7PSkKebRlIL2sz2CouXcyzg0OYWZZC63+Pg+KKFmrPtcXH1ZUS
 utNrCYcOnzntnXv5FBkbRqQDY+9BPQuvX9qep7otmVkYp9BMoeYPSjW1YEbh0PKiXZND
 wqbO+fhOMV8IHGw05yTJv5NDhsy1MoHyefb99EzyVWnk4gIhg7CruyaVcVtawP4UrTaM
 qdCCIv/TEwYkx2tses/7xijo9+ghh2lj38btbto+pEasvD3Uy9k11CW529TuIjavW2os
 eeLw==
X-Gm-Message-State: AOAM533TXWfFY6MqEjQujAwa0pLU2BV3x0fd37j6Ru/fEipaMTSe9Rul
 GSmfM7I5SFNk6qF9eYu/qoa/r9kmJE7Wa9pxrcX7DTVl2v0MOhOpW6LJAj1YpDdFWqlO7L3VjWy
 6/m1GbooJjtnHgK7yxEy/lFqeqw==
X-Received: by 2002:a05:620a:28d4:b0:6a0:9a5f:3d8b with SMTP id
 l20-20020a05620a28d400b006a09a5f3d8bmr447502qkp.622.1652895749916; 
 Wed, 18 May 2022 10:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsaAYvaEnXkla++uS3M0ZTT7PUHnJoPIH7slsRFvYtHghk7YrWclp4mxFyi/YywGJukdHn3Q==
X-Received: by 2002:a05:620a:28d4:b0:6a0:9a5f:3d8b with SMTP id
 l20-20020a05620a28d400b006a09a5f3d8bmr447485qkp.622.1652895749629; 
 Wed, 18 May 2022 10:42:29 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 a194-20020a3766cb000000b006a32c4a2cb8sm94092qkc.52.2022.05.18.10.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 10:42:29 -0700 (PDT)
Message-ID: <c703a49c57d77f4fcadba09a55fa926049dfe114.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>
Date: Wed, 18 May 2022 13:42:27 -0400
In-Reply-To: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
References: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] nouveau lockdep deadlock report with 5.18-rc6
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Yeah I noticed this as well, I will try to bisect this the next change that I
get


On Tue, 2022-05-17 at 13:10 +0200, Hans de Goede wrote:
> Hi All,
> 
> I just noticed the below lockdep possible deadlock report with a 5.18-rc6
> kernel on a Dell Latitude E6430 laptop with the following nvidia GPU:
> 
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GLM [NVS
> 5200M] [10de:0dfc] (rev a1)
> 01:00.1 Audio device [0403]: NVIDIA Corporation GF108 High Definition Audio
> Controller [10de:0bea] (rev a1)
> 
> This is with the laptop in Optimus mode, so with the Intel integrated
> gfx from the i5-3320M CPU driving the LCD panel and with nothing connected
> to the HDMI connector, which is always routed to the NVIDIA GPU on this
> laptop.
> 
> The lockdep possible deadlock warning seems to happen when the NVIDIA GPU
> is runtime suspended shortly after gdm has loaded:
> 
> [   24.859171] ======================================================
> [   24.859173] WARNING: possible circular locking dependency detected
> [   24.859175] 5.18.0-rc6+ #34 Tainted: G            E    
> [   24.859178] ------------------------------------------------------
> [   24.859179] kworker/1:1/46 is trying to acquire lock:
> [   24.859181] ffff92b0c0ee0518 (&cli->mutex){+.+.}-{3:3}, at:
> nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859231] 
>                but task is already holding lock:
> [   24.859233] ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-{3:3},
> at: ttm_bo_wait+0x7d/0x140 [ttm]
> [   24.859243] 
>                which lock already depends on the new lock.
> 
> [   24.859244] 
>                the existing dependency chain (in reverse order) is:
> [   24.859246] 
>                -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [   24.859249]        __ww_mutex_lock.constprop.0+0xb3/0xfb0
> [   24.859256]        ww_mutex_lock+0x38/0xa0
> [   24.859259]        nouveau_bo_pin+0x30/0x380 [nouveau]
> [   24.859297]        nouveau_channel_del+0x1d7/0x3e0 [nouveau]
> [   24.859328]        nouveau_channel_new+0x48/0x730 [nouveau]
> [   24.859358]        nouveau_abi16_ioctl_channel_alloc+0x113/0x360
> [nouveau]
> [   24.859389]        drm_ioctl_kernel+0xa1/0x150
> [   24.859392]        drm_ioctl+0x21c/0x410
> [   24.859395]        nouveau_drm_ioctl+0x56/0x1820 [nouveau]
> [   24.859431]        __x64_sys_ioctl+0x8d/0xc0
> [   24.859436]        do_syscall_64+0x5b/0x80
> [   24.859440]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   24.859443] 
>                -> #0 (&cli->mutex){+.+.}-{3:3}:
> [   24.859446]        __lock_acquire+0x12e2/0x1f90
> [   24.859450]        lock_acquire+0xad/0x290
> [   24.859453]        __mutex_lock+0x90/0x830
> [   24.859456]        nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859493]        ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
> [   24.859498]        ttm_mem_evict_first+0x25c/0x4b0 [ttm]
> [   24.859503]        ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
> [   24.859509]        nouveau_debugfs_fini+0x161/0x260 [nouveau]
> [   24.859545]        nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
> [   24.859582]        pci_pm_runtime_suspend+0x5c/0x180
> [   24.859585]        __rpm_callback+0x48/0x1b0
> [   24.859589]        rpm_callback+0x5a/0x70
> [   24.859591]        rpm_suspend+0x10a/0x6f0
> [   24.859594]        pm_runtime_work+0xa0/0xb0
> [   24.859596]        process_one_work+0x254/0x560
> [   24.859601]        worker_thread+0x4f/0x390
> [   24.859604]        kthread+0xe6/0x110
> [   24.859607]        ret_from_fork+0x22/0x30
> [   24.859611] 
>                other info that might help us debug this:
> 
> [   24.859612]  Possible unsafe locking scenario:
> 
> [   24.859613]        CPU0                    CPU1
> [   24.859615]        ----                    ----
> [   24.859616]   lock(reservation_ww_class_mutex);
> [   24.859618]                                lock(&cli->mutex);
> [   24.859620]                               
> lock(reservation_ww_class_mutex);
> [   24.859622]   lock(&cli->mutex);
> [   24.859624] 
>                 *** DEADLOCK ***
> 
> [   24.859625] 3 locks held by kworker/1:1/46:
> [   24.859627]  #0: ffff92b0c0bb4338 ((wq_completion)pm){+.+.}-{0:0}, at:
> process_one_work+0x1d0/0x560
> [   24.859634]  #1: ffffa8ffc02dfe80 ((work_completion)(&dev-
> >power.work)){+.+.}-{0:0}, at: process_one_work+0x1d0/0x560
> [   24.859641]  #2: ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-
> {3:3}, at: ttm_bo_wait+0x7d/0x140 [ttm]
> [   24.859649] 
>                stack backtrace:
> [   24.859651] CPU: 1 PID: 46 Comm: kworker/1:1 Tainted: G            E    
> 5.18.0-rc6+ #34
> [   24.859654] Hardware name: Dell Inc. Latitude E6430/0H3MT5, BIOS A21
> 05/08/2017
> [   24.859656] Workqueue: pm pm_runtime_work
> [   24.859660] Call Trace:
> [   24.859662]  <TASK>
> [   24.859665]  dump_stack_lvl+0x5b/0x74
> [   24.859669]  check_noncircular+0xdf/0x100
> [   24.859672]  ? register_lock_class+0x38/0x470
> [   24.859678]  __lock_acquire+0x12e2/0x1f90
> [   24.859683]  lock_acquire+0xad/0x290
> [   24.859686]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859724]  ? lock_is_held_type+0xa6/0x120
> [   24.859730]  __mutex_lock+0x90/0x830
> [   24.859733]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859770]  ? nvif_vmm_map+0x114/0x130 [nouveau]
> [   24.859791]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859829]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859866]  nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859905]  ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
> [   24.859912]  ttm_mem_evict_first+0x25c/0x4b0 [ttm]
> [   24.859919]  ? lock_release+0x20/0x2a0
> [   24.859923]  ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
> [   24.859930]  nouveau_debugfs_fini+0x161/0x260 [nouveau]
> [   24.859968]  nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
> [   24.860005]  pci_pm_runtime_suspend+0x5c/0x180
> [   24.860008]  ? pci_dev_put+0x20/0x20
> [   24.860011]  __rpm_callback+0x48/0x1b0
> [   24.860014]  ? pci_dev_put+0x20/0x20
> [   24.860018]  rpm_callback+0x5a/0x70
> [   24.860020]  ? pci_dev_put+0x20/0x20
> [   24.860023]  rpm_suspend+0x10a/0x6f0
> [   24.860025]  ? process_one_work+0x1d0/0x560
> [   24.860031]  pm_runtime_work+0xa0/0xb0
> [   24.860034]  process_one_work+0x254/0x560
> [   24.860039]  worker_thread+0x4f/0x390
> [   24.860043]  ? process_one_work+0x560/0x560
> [   24.860046]  kthread+0xe6/0x110
> [   24.860049]  ? kthread_complete_and_exit+0x20/0x20
> [   24.860053]  ret_from_fork+0x22/0x30
> [   24.860059]  </TASK>
> 
> Regards,
> 
> Hans
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

