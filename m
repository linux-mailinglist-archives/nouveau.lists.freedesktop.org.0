Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A72B386F
	for <lists+nouveau@lfdr.de>; Sun, 15 Nov 2020 20:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E366E9AA;
	Sun, 15 Nov 2020 19:19:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017176E9B1
 for <nouveau@lists.freedesktop.org>; Sun, 15 Nov 2020 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605467943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCCB4kGE5u8SQ4kfoQDLrp9FJN8dTyFE6UeZlWCt9dk=;
 b=HL+Of+bQ6nf8q/69O1WVMqBO3x3rCemlaR17W8jMoCu9Qb1OdCd4HMG25a/T/5cYoC9Bt/
 MPd1CdQ8y5Ywyq61HyUHR/ph1eeJyyYzgFNycbA7bPghtEMsnB2Bf/PNxjDoVLxNi/+yAC
 dlyCQV5VA/nCDdfzKqEr0C8tKew9+TM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-zENewiloMRapM3bwUAvB_w-1; Sun, 15 Nov 2020 14:18:58 -0500
X-MC-Unique: zENewiloMRapM3bwUAvB_w-1
Received: by mail-qt1-f200.google.com with SMTP id 7so8818224qtw.23
 for <nouveau@lists.freedesktop.org>; Sun, 15 Nov 2020 11:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yCCB4kGE5u8SQ4kfoQDLrp9FJN8dTyFE6UeZlWCt9dk=;
 b=g3237eGOvDGezqha8B+TBcjR8ZTuV2MtaA978dIyhnjNexMHeEmkFwsGUau9KRQGNe
 hWQ8NKtfd3IFSDbOhHnvNMYo+nduweN701cbaoBTNZ1ajq8q+/P3IeN6HcddZ2Dd3ca3
 cCI3ZcP0tJuyNhPqeJv0RNolh1acioyqkVdiM/4YuBYwkYu7BcxCjaiWrGsGSpf/SVjw
 qpWESKy3YdlYaeDN3T2M37eJYB6q+8a3oFUrvMStWVAW1ssR3j7wIvt7sKavVTPSW/vJ
 IaSGtfv/m4b/4HDZ4yCMK+nCQIoMCisayBQBq0oAs+uuszz8vm9MW1f4xMW1Ag8mskD3
 fK5A==
X-Gm-Message-State: AOAM530lnxz6RD1Wa8f+2ny72eFpU7n2zATPQiNptBSPvQp9kfaazGv/
 MV4SBzH6ECClTFYmI4IckjDafrhgeKCPhDevhBQLf0Xn5WsLK5snksOOsFBNaeF9+C/ejhFtgdQ
 oIDPVDvbig+21jRnFjuDVWvO4RVgUdLrrZD2U6NvSpA==
X-Received: by 2002:aed:2726:: with SMTP id n35mr11183181qtd.254.1605467937078; 
 Sun, 15 Nov 2020 11:18:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHETKwdKKBJj5KgI/hX4P/deHzq7lVZjWjtJTyIBC1ruW6OXslmjAhSoniCuq6m5LdlgghZBGbH0mnxxmaLZw=
X-Received: by 2002:aed:2726:: with SMTP id n35mr11183166qtd.254.1605467936806; 
 Sun, 15 Nov 2020 11:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20200828092846.GA11454@localhost.localdomain>
 <20201115091010.GA132466@eldamar.lan>
In-Reply-To: <20201115091010.GA132466@eldamar.lan>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 15 Nov 2020 20:18:45 +0100
Message-ID: <CACO55tvwtYj0QGFy3Bk5-13bm7cjHGko3WegY1fFbtf0WckQyQ@mail.gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau: bail out of nouveau_channel_new
 if channel init fails
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frantisek Hrbata <frantisek@hrbata.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 6:43 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi,
>
> On Fri, Aug 28, 2020 at 11:28:46AM +0200, Frantisek Hrbata wrote:
> > Unprivileged user can crash kernel by using DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC
> > ioctl. This was reported by trinity[1] fuzzer.
> >
> > [   71.073906] nouveau 0000:01:00.0: crashme[1329]: channel failed to initialise, -17
> > [   71.081730] BUG: kernel NULL pointer dereference, address: 00000000000000a0
> > [   71.088928] #PF: supervisor read access in kernel mode
> > [   71.094059] #PF: error_code(0x0000) - not-present page
> > [   71.099189] PGD 119590067 P4D 119590067 PUD 1054f5067 PMD 0
> > [   71.104842] Oops: 0000 [#1] SMP NOPTI
> > [   71.108498] CPU: 2 PID: 1329 Comm: crashme Not tainted 5.8.0-rc6+ #2
> > [   71.114993] Hardware name: AMD Pike/Pike, BIOS RPK1506A 09/03/2014
> > [   71.121213] RIP: 0010:nouveau_abi16_ioctl_channel_alloc+0x108/0x380 [nouveau]
> > [   71.128339] Code: 48 89 9d f0 00 00 00 41 8b 4c 24 04 41 8b 14 24 45 31 c0 4c 8d 4b 10 48 89 ee 4c 89 f7 e8 10 11 00 00 85 c0 75 78 48 8b 43 10 <8b> 90 a0 00 00 00 41 89 54 24 08 80 7d 3d 05 0f 86 bb 01 00 00 41
> > [   71.147074] RSP: 0018:ffffb4a1809cfd38 EFLAGS: 00010246
> > [   71.152526] RAX: 0000000000000000 RBX: ffff98cedbaa1d20 RCX: 00000000000003bf
> > [   71.159651] RDX: 00000000000003be RSI: 0000000000000000 RDI: 0000000000030160
> > [   71.166774] RBP: ffff98cee776de00 R08: ffffdc0144198a08 R09: ffff98ceeefd4000
> > [   71.173901] R10: ffff98cee7e81780 R11: 0000000000000001 R12: ffffb4a1809cfe08
> > [   71.181214] R13: ffff98cee776d000 R14: ffff98cec519e000 R15: ffff98cee776def0
> > [   71.188339] FS:  00007fd926250500(0000) GS:ffff98ceeac80000(0000) knlGS:0000000000000000
> > [   71.196418] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   71.202155] CR2: 00000000000000a0 CR3: 0000000106622000 CR4: 00000000000406e0
> > [   71.209297] Call Trace:
> > [   71.211777]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> > [   71.218053]  drm_ioctl_kernel+0xac/0xf0 [drm]
> > [   71.222421]  drm_ioctl+0x211/0x3c0 [drm]
> > [   71.226379]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> > [   71.232500]  nouveau_drm_ioctl+0x57/0xb0 [nouveau]
> > [   71.237285]  ksys_ioctl+0x86/0xc0
> > [   71.240595]  __x64_sys_ioctl+0x16/0x20
> > [   71.244340]  do_syscall_64+0x4c/0x90
> > [   71.248110]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [   71.253162] RIP: 0033:0x7fd925d4b88b
> > [   71.256731] Code: Bad RIP value.
> > [   71.259955] RSP: 002b:00007ffc743592d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> > [   71.267514] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fd925d4b88b
> > [   71.274637] RDX: 0000000000601080 RSI: 00000000c0586442 RDI: 0000000000000003
> > [   71.281986] RBP: 00007ffc74359340 R08: 00007fd926016ce0 R09: 00007fd926016ce0
> > [   71.289111] R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000400620
> > [   71.296235] R13: 00007ffc74359420 R14: 0000000000000000 R15: 0000000000000000
> > [   71.303361] Modules linked in: rfkill sunrpc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep kvm_amd snd_seq ccp snd_seq_device snd_pcm kvm snd_timer snd irqbypass soundcore sp5100_tco pcspkr crct10dif_pclmul crc32_pclmul ghash_clmulni_intel wmi_bmof joydev i2c_piix4 fam15h_power k10temp acpi_cpufreq ip_tables xfs libcrc32c sd_mod t10_pi sg nouveau video mxm_wmi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm broadcom bcm_phy_lib ata_generic ahci drm e1000 crc32c_intel libahci serio_raw tg3 libata firewire_ohci firewire_core wmi crc_itu_t dm_mirror dm_region_hash dm_log dm_mod
> > [   71.365269] CR2: 00000000000000a0
> >
> > simplified reproducer
> > ---------------------------------8<----------------------------------------
> > /*
> >  * gcc -o crashme crashme.c
> >  * ./crashme /dev/dri/renderD128
> >  */
> >
> > struct drm_nouveau_channel_alloc {
> >       uint32_t     fb_ctxdma_handle;
> >       uint32_t     tt_ctxdma_handle;
> >
> >       int          channel;
> >       uint32_t     pushbuf_domains;
> >
> >       /* Notifier memory */
> >       uint32_t     notifier_handle;
> >
> >       /* DRM-enforced subchannel assignments */
> >       struct {
> >               uint32_t handle;
> >               uint32_t grclass;
> >       } subchan[8];
> >       uint32_t nr_subchan;
> > };
> >
> > static struct drm_nouveau_channel_alloc channel;
> >
> > int main(int argc, char *argv[]) {
> >       int fd;
> >       int rv;
> >
> >       if (argc != 2)
> >               die("usage: %s <dev>", 0, argv[0]);
> >
> >       if ((fd = open(argv[1], O_RDONLY)) == -1)
> >               die("open %s", errno, argv[1]);
> >
> >       if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
> >                       errno == EACCES)
> >               die("ioctl %s", errno, argv[1]);
> >
> >       close(fd);
> >
> >       printf("PASS\n");
> >
> >       return 0;
> > }
> > ---------------------------------8<----------------------------------------
> >
> > [1] https://github.com/kernelslacker/trinity
> >
> > Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
> > Signed-off-by: Frantisek Hrbata <frantisek at hrbata.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_chan.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > index b80e4ebf1..a7a47b325 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > @@ -533,6 +533,7 @@ nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *device,
> >       if (ret) {
> >               NV_PRINTK(err, cli, "channel failed to initialise, %d\n", ret);
> >               nouveau_channel_del(pchan);
> > +             goto done;
> >       }
> >
> >       ret = nouveau_svmm_join((*pchan)->vmm->svmm, (*pchan)->inst);
> > --
> > Frantisek Hrbata
>
> Is this still planned to be applied? AFAICS this is the fix for
> CVE-2020-25639.
>

If it's urgent to get it fixed, I suggest going through the Linux
kernel or drm stable path. CCing dri-devel, Dave, Daniel and Ben.

> Regards,
> Salvatore
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
