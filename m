Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABB2B3760
	for <lists+nouveau@lfdr.de>; Sun, 15 Nov 2020 18:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AFF6E9A1;
	Sun, 15 Nov 2020 17:43:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886D6E998
 for <nouveau@lists.freedesktop.org>; Sun, 15 Nov 2020 09:10:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r17so15293441wrw.1
 for <nouveau@lists.freedesktop.org>; Sun, 15 Nov 2020 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4eponZdnwAOTRF+xl2WevIJxIkQKAmFeuBPGM3LlWrc=;
 b=qHkJCrcEx3u7ndcx6b2dI4yASVEhwV2TojDxgluyeUD1OE8+6/7WyJLwRRXiWep9JK
 tMgl8AeB/dkOh1hBkI3dwiJmbkQOsSntwcLrZMrAf49VmaEpm4JHo+7mWJDPToB2QUkT
 huOZRKWyKWfLdprgbAht/3rFjxI2FSWUuN9JhKoHOAkP0ExAlKZbxrJIJlRDO+wgm+Oq
 9TAQyzSKV1AZh636FG7ximP4h0VU4MU8/+at1LQGGEzUwF9sL3odK4C86bco/a8DuRtC
 tZpeymINtEkdmaAEwMyyzhm5ZMXmhwiQHQ1cAWm2aPcGUYA/QmBMTvx28tg0soP21zgU
 rynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=4eponZdnwAOTRF+xl2WevIJxIkQKAmFeuBPGM3LlWrc=;
 b=LJ0ESdC++inQjegLbFdUL98vzwo8jnojt0K/piEVkqFM/tGuKHtwDbjj4zHLajLwDb
 FgYvMpx5h0G6Ix3hIv3vG0n91twKQv3EGcgj9tKFKCje0TFh+I5ZwQZPdKzMpAmft0rb
 r1sQG+FupSoRdvk7k4pcB5Y10xBL2cqDE/GrGuSK0qmDSdv6R3fgjDZfow4rUtZwLdwv
 gKczUFih4Bd8HDqPj5WFcpuyF+LZkXqCDyavNctIDgfpMlIX7OrgLoTTSuBrd5YjfpWL
 BTX6NRKkMjb3qJ0ptBUUEO0RH5+RDMq8V2UmOv0vp+x0WU+db1WCb6pvQJD4AYnecwHM
 snWw==
X-Gm-Message-State: AOAM532JPtb+DoH95muBbda2pE3G8hEoKiSFe+JN0eDDcwuxMtIGd3xT
 xmUVkSKSgzj18sQiZd55VNx/LTYmY+3WiQ==
X-Google-Smtp-Source: ABdhPJxfYoxNIoSIYuMN1o4vTgWewqhG9h/8pCmYihZRUpb3XAFAPOsiWY6re7+QEKlOa33WM+VauQ==
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr13319941wrx.196.1605431412668; 
 Sun, 15 Nov 2020 01:10:12 -0800 (PST)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id t11sm11565480wrm.8.2020.11.15.01.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 01:10:11 -0800 (PST)
Date: Sun, 15 Nov 2020 10:10:10 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: nouveau@lists.freedesktop.org
Message-ID: <20201115091010.GA132466@eldamar.lan>
References: <20200828092846.GA11454@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828092846.GA11454@localhost.localdomain>
X-Mailman-Approved-At: Sun, 15 Nov 2020 17:43:25 +0000
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
Cc: Frantisek Hrbata <frantisek@hrbata.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 28, 2020 at 11:28:46AM +0200, Frantisek Hrbata wrote:
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
> 	uint32_t     fb_ctxdma_handle;
> 	uint32_t     tt_ctxdma_handle;
> 
> 	int          channel;
> 	uint32_t     pushbuf_domains;
> 
> 	/* Notifier memory */
> 	uint32_t     notifier_handle;
> 
> 	/* DRM-enforced subchannel assignments */
> 	struct {
> 		uint32_t handle;
> 		uint32_t grclass;
> 	} subchan[8];
> 	uint32_t nr_subchan;
> };
> 
> static struct drm_nouveau_channel_alloc channel;
> 
> int main(int argc, char *argv[]) {
> 	int fd;
> 	int rv;
> 
> 	if (argc != 2)
> 		die("usage: %s <dev>", 0, argv[0]);
> 
> 	if ((fd = open(argv[1], O_RDONLY)) == -1)
> 		die("open %s", errno, argv[1]);
> 
> 	if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
> 			errno == EACCES)
> 		die("ioctl %s", errno, argv[1]);
> 
> 	close(fd);
> 
> 	printf("PASS\n");
> 
> 	return 0;
> }
> ---------------------------------8<----------------------------------------
> 
> [1] https://github.com/kernelslacker/trinity
> 
> Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
> Signed-off-by: Frantisek Hrbata <frantisek at hrbata.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index b80e4ebf1..a7a47b325 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -533,6 +533,7 @@ nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *device,
>  	if (ret) {
>  		NV_PRINTK(err, cli, "channel failed to initialise, %d\n", ret);
>  		nouveau_channel_del(pchan);
> +		goto done;
>  	}
>  
>  	ret = nouveau_svmm_join((*pchan)->vmm->svmm, (*pchan)->inst);
> -- 
> Frantisek Hrbata

Is this still planned to be applied? AFAICS this is the fix for
CVE-2020-25639.

Regards,
Salvatore
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
