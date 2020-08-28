Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D5255FD4
	for <lists+nouveau@lfdr.de>; Fri, 28 Aug 2020 19:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC26E4F4;
	Fri, 28 Aug 2020 17:37:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DD26E4F4
 for <nouveau@lists.freedesktop.org>; Fri, 28 Aug 2020 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598636224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEqdWaBy7ffj3xT/ym/d5lFqJ5ZHarRR23QDzQDyzDA=;
 b=dyaUHGCdun1sKfs/3NpTTfIvEaw0odrGMxrwqhNHT2PwXeGSLfkB+1gaZs16AM0MaGjOoY
 nLlKymjkGhk8tM1Fg0T9EYjgF5aPp1+xqJ0Nt081DPPKBmGu4aXvP6PXLsCkB1h2x0Hjct
 trWGy55a2S/zle6H0cVyQl147hUW4zM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-NFsplnwZPXCTCxWlV5OiUg-1; Fri, 28 Aug 2020 13:36:58 -0400
X-MC-Unique: NFsplnwZPXCTCxWlV5OiUg-1
Received: by mail-qk1-f197.google.com with SMTP id c67so1530523qkd.0
 for <nouveau@lists.freedesktop.org>; Fri, 28 Aug 2020 10:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tEqdWaBy7ffj3xT/ym/d5lFqJ5ZHarRR23QDzQDyzDA=;
 b=XMlGNN62PYKB35i+q+E/D/VCUxYkfWqc66qh1At6cEUup/VCjz7uqb0TU2pjVb9wTf
 JAM+t5pbrv4WKNg9Xg3Pdhwd9Z+kubV9LT+4L2YJl45oNOqLxb+OcPopGyl+WCZY1OJJ
 zZIp0i1s7nd2Z7Vm4yXc4V1MRsyWZKcfLcoE4Z3ijO9UloCUl6pKAxbuaqi4xrNDVe79
 AwotQSbTbs86E5TBGTqO2jTRdidg0+8dTAq/pLBdcJL4xtxtvuEXq/5OCXR6laSm0eLx
 0S2V1qkuJL4dziOgEdOAiMR3RNRbn2igsiQ2drHHuIP7lX4keYfdTekLZzuoh9dzyla/
 hQcg==
X-Gm-Message-State: AOAM533iK5/vGPP1qssiwRaC61oXblwBIqQSEfFote6yPQK4CmySMpF7
 ZBBBrncHDRe3dzDJcLXXkHkC/Ady+ZZNTCeVGEdxZQfu89Qk4OrXmkY/O/PDHvpskdy/gm5oQuf
 xjN9iHdSbKxYGFIw0sHfaP2bLmRAaU8Odxvy+bz15Bw==
X-Received: by 2002:a37:4d09:: with SMTP id a9mr209130qkb.157.1598636217474;
 Fri, 28 Aug 2020 10:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr4wYuUywG8XFO5qL1sCYR2qFAEJ2NHq0NIGODz6WeINN8yIszBCZW2DkTWG3yXP9XY8x83NQrqwKzwOyNZuE=
X-Received: by 2002:a37:4d09:: with SMTP id a9mr209108qkb.157.1598636217155;
 Fri, 28 Aug 2020 10:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200828092846.GA11454@localhost.localdomain>
In-Reply-To: <20200828092846.GA11454@localhost.localdomain>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Aug 2020 19:36:46 +0200
Message-ID: <CACO55ttuuEQ9P2+StqyaDMQWEAUaFOoWW+br-mkiYQgEqouo0g@mail.gmail.com>
To: Frantisek Hrbata <frantisek@hrbata.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 2:05 PM Frantisek Hrbata <frantisek@hrbata.com> wrote:
>
> Unprivileged user can crash kernel by using DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC
> ioctl. This was reported by trinity[1] fuzzer.
>
> [   71.073906] nouveau 0000:01:00.0: crashme[1329]: channel failed to initialise, -17
> [   71.081730] BUG: kernel NULL pointer dereference, address: 00000000000000a0
> [   71.088928] #PF: supervisor read access in kernel mode
> [   71.094059] #PF: error_code(0x0000) - not-present page
> [   71.099189] PGD 119590067 P4D 119590067 PUD 1054f5067 PMD 0
> [   71.104842] Oops: 0000 [#1] SMP NOPTI
> [   71.108498] CPU: 2 PID: 1329 Comm: crashme Not tainted 5.8.0-rc6+ #2
> [   71.114993] Hardware name: AMD Pike/Pike, BIOS RPK1506A 09/03/2014
> [   71.121213] RIP: 0010:nouveau_abi16_ioctl_channel_alloc+0x108/0x380 [nouveau]
> [   71.128339] Code: 48 89 9d f0 00 00 00 41 8b 4c 24 04 41 8b 14 24 45 31 c0 4c 8d 4b 10 48 89 ee 4c 89 f7 e8 10 11 00 00 85 c0 75 78 48 8b 43 10 <8b> 90 a0 00 00 00 41 89 54 24 08 80 7d 3d 05 0f 86 bb 01 00 00 41
> [   71.147074] RSP: 0018:ffffb4a1809cfd38 EFLAGS: 00010246
> [   71.152526] RAX: 0000000000000000 RBX: ffff98cedbaa1d20 RCX: 00000000000003bf
> [   71.159651] RDX: 00000000000003be RSI: 0000000000000000 RDI: 0000000000030160
> [   71.166774] RBP: ffff98cee776de00 R08: ffffdc0144198a08 R09: ffff98ceeefd4000
> [   71.173901] R10: ffff98cee7e81780 R11: 0000000000000001 R12: ffffb4a1809cfe08
> [   71.181214] R13: ffff98cee776d000 R14: ffff98cec519e000 R15: ffff98cee776def0
> [   71.188339] FS:  00007fd926250500(0000) GS:ffff98ceeac80000(0000) knlGS:0000000000000000
> [   71.196418] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   71.202155] CR2: 00000000000000a0 CR3: 0000000106622000 CR4: 00000000000406e0
> [   71.209297] Call Trace:
> [   71.211777]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> [   71.218053]  drm_ioctl_kernel+0xac/0xf0 [drm]
> [   71.222421]  drm_ioctl+0x211/0x3c0 [drm]
> [   71.226379]  ? nouveau_abi16_ioctl_getparam+0x1f0/0x1f0 [nouveau]
> [   71.232500]  nouveau_drm_ioctl+0x57/0xb0 [nouveau]
> [   71.237285]  ksys_ioctl+0x86/0xc0
> [   71.240595]  __x64_sys_ioctl+0x16/0x20
> [   71.244340]  do_syscall_64+0x4c/0x90
> [   71.248110]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   71.253162] RIP: 0033:0x7fd925d4b88b
> [   71.256731] Code: Bad RIP value.
> [   71.259955] RSP: 002b:00007ffc743592d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> [   71.267514] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fd925d4b88b
> [   71.274637] RDX: 0000000000601080 RSI: 00000000c0586442 RDI: 0000000000000003
> [   71.281986] RBP: 00007ffc74359340 R08: 00007fd926016ce0 R09: 00007fd926016ce0
> [   71.289111] R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000400620
> [   71.296235] R13: 00007ffc74359420 R14: 0000000000000000 R15: 0000000000000000
> [   71.303361] Modules linked in: rfkill sunrpc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep kvm_amd snd_seq ccp snd_seq_device snd_pcm kvm snd_timer snd irqbypass soundcore sp5100_tco pcspkr crct10dif_pclmul crc32_pclmul ghash_clmulni_intel wmi_bmof joydev i2c_piix4 fam15h_power k10temp acpi_cpufreq ip_tables xfs libcrc32c sd_mod t10_pi sg nouveau video mxm_wmi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm broadcom bcm_phy_lib ata_generic ahci drm e1000 crc32c_intel libahci serio_raw tg3 libata firewire_ohci firewire_core wmi crc_itu_t dm_mirror dm_region_hash dm_log dm_mod
> [   71.365269] CR2: 00000000000000a0
>
> simplified reproducer
> ---------------------------------8<----------------------------------------
> /*
>  * gcc -o crashme crashme.c
>  * ./crashme /dev/dri/renderD128
>  */
>
> struct drm_nouveau_channel_alloc {
>         uint32_t     fb_ctxdma_handle;
>         uint32_t     tt_ctxdma_handle;
>
>         int          channel;
>         uint32_t     pushbuf_domains;
>
>         /* Notifier memory */
>         uint32_t     notifier_handle;
>
>         /* DRM-enforced subchannel assignments */
>         struct {
>                 uint32_t handle;
>                 uint32_t grclass;
>         } subchan[8];
>         uint32_t nr_subchan;
> };
>
> static struct drm_nouveau_channel_alloc channel;
>
> int main(int argc, char *argv[]) {
>         int fd;
>         int rv;
>
>         if (argc != 2)
>                 die("usage: %s <dev>", 0, argv[0]);
>
>         if ((fd = open(argv[1], O_RDONLY)) == -1)
>                 die("open %s", errno, argv[1]);
>
>         if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
>                         errno == EACCES)
>                 die("ioctl %s", errno, argv[1]);
>
>         close(fd);
>
>         printf("PASS\n");
>
>         return 0;
> }
> ---------------------------------8<----------------------------------------
>
> [1] https://github.com/kernelslacker/trinity
>
> Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
> Signed-off-by: Frantisek Hrbata <frantisek@hrbata.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index b80e4ebf1..a7a47b325 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -533,6 +533,7 @@ nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *device,
>         if (ret) {
>                 NV_PRINTK(err, cli, "channel failed to initialise, %d\n", ret);
>                 nouveau_channel_del(pchan);
> +               goto done;
>         }
>
>         ret = nouveau_svmm_join((*pchan)->vmm->svmm, (*pchan)->inst);
> --
> Frantisek Hrbata
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
