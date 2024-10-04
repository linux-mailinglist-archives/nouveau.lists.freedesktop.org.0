Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65C9909FD
	for <lists+nouveau@lfdr.de>; Fri,  4 Oct 2024 19:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425F610EA48;
	Fri,  4 Oct 2024 17:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qYWuudys";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3345E10EA48
 for <nouveau@lists.freedesktop.org>; Fri,  4 Oct 2024 17:10:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19B275C59AE;
 Fri,  4 Oct 2024 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9BEC4CECD;
 Fri,  4 Oct 2024 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728061844;
 bh=CHb75vA+7IQ3dVbqFIxg0wG5cdUIzaqH72KZ/Gt4DRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qYWuudys63lKGQjRniaBwVgOSi/X1bHyMBQlYEr6kib3m22B67BJ394sIfcvtIFer
 TotDLZEIPzYDQmTJYVQJ6skr2zhMo4q5w6wHBeZaEElS88t1542xKjq6Dsh/N6ACMr
 0NDMErZcHV1WZUGQB2vSKY4ZmL86QPkbzC2+NUsBm9kwoz/m9EkbXbXikop+7zac6P
 jgx4DtR/wILvzJFuZNMDmAa0jvmgo5QHAzxkOCPXFB3q5rsL2jMwCupPHDy71an5IR
 yid1W/5vITeqd7G+Ddqfbisue+Qo870ogQsVcxY0ebrgYRmacoVpwXmA+GayFtf7Yb
 axsbMsvHSFDJw==
Date: Fri, 4 Oct 2024 19:10:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 1/3] nvkm/gsp: correctly advance the read pointer of GSP
 message queue
Message-ID: <ZwAhjctJdIZRbyAX@pollux>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
 <20240922130709.1946893-2-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240922130709.1946893-2-zhiw@nvidia.com>
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

Hi Zhi,

On Sun, Sep 22, 2024 at 06:07:07AM -0700, Zhi Wang wrote:
> A GSP event message consists three parts: message header, RPC header,
> message body. GSP calculates the number of pages to write from the
> total size of a GSP message. This behavior can be observed from the
> movement of the write pointer.
>=20
> However, nvkm takes only the size of RPC header and message body as
> the message size when advancing the read pointer. When handling a
> two-page GSP message in the non rollback case, It wrongly takes the
> message body of the previous message as the message header of the next
> message. As the "message length" tends to be zero, in the calculation of
> size needs to be copied (0 - size of (message header)), the size needs to
> be copied will be "0xffffffxx". It also triggers a kernel panic due to a
> NULL pointer error.
>=20
> [  547.614102] msg: 00000f90: ff ff ff ff ff ff ff ff 40 d7 18 fb 8b 00 0=
0 00  ........@.......
> [  547.622533] msg: 00000fa0: 00 00 00 00 ff ff ff ff ff ff ff ff 00 00 0=
0 00  ................
> [  547.630965] msg: 00000fb0: ff ff ff ff ff ff ff ff 00 00 00 00 ff ff f=
f ff  ................
> [  547.639397] msg: 00000fc0: ff ff ff ff 00 00 00 00 ff ff ff ff ff ff f=
f ff  ................
> [  547.647832] nvkm 0000:c1:00.0: gsp: peek msg rpc fn:0 len:0x0/0xffffff=
ffffffffe0
> [  547.655225] nvkm 0000:c1:00.0: gsp: get msg rpc fn:0 len:0x0/0xfffffff=
fffffffe0
> [  547.662532] BUG: kernel NULL pointer dereference, address: 00000000000=
00020
> [  547.669485] #PF: supervisor read access in kernel mode
> [  547.674624] #PF: error_code(0x0000) - not-present page
> [  547.679755] PGD 0 P4D 0
> [  547.682294] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  547.686643] CPU: 22 PID: 322 Comm: kworker/22:1 Tainted: G            =
E      6.9.0-rc6+ #1
> [  547.694893] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS L3.=
12E 09/06/2022
> [  547.702626] Workqueue: events r535_gsp_msgq_work [nvkm]
> [  547.707921] RIP: 0010:r535_gsp_msg_recv+0x87/0x230 [nvkm]
> [  547.713375] Code: 00 8b 70 08 48 89 e1 31 d2 4c 89 f7 e8 12 f5 ff ff 4=
8 89 c5 48 85 c0 0f 84 cf 00 00 00 48 81 fd 00 f0 ff ff 0f 87 c4 00 00 00 <=
8b> 55 10 41 8b 46 30 85 d2 0f 85 f6 00 00 00 83 f8 04 76 10 ba 05
> [  547.732119] RSP: 0018:ffffabe440f87e10 EFLAGS: 00010203
> [  547.737335] RAX: 0000000000000010 RBX: 0000000000000008 RCX: 000000000=
000003f
> [  547.744461] RDX: 0000000000000000 RSI: ffffabe4480a8030 RDI: 000000000=
0000010
> [  547.751585] RBP: 0000000000000010 R08: 0000000000000000 R09: ffffabe44=
0f87bb0
> [  547.758707] R10: ffffabe440f87dc8 R11: 0000000000000010 R12: 000000000=
0000000
> [  547.765834] R13: 0000000000000000 R14: ffff9351df1e5000 R15: 000000000=
0000000
> [  547.772958] FS:  0000000000000000(0000) GS:ffff93708eb00000(0000) knlG=
S:0000000000000000
> [  547.781035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  547.786771] CR2: 0000000000000020 CR3: 00000003cc220002 CR4: 000000000=
0770ef0
> [  547.793896] PKRU: 55555554
> [  547.796600] Call Trace:
> [  547.799046]  <TASK>
> [  547.801152]  ? __die+0x20/0x70
> [  547.804211]  ? page_fault_oops+0x75/0x170
> [  547.808221]  ? print_hex_dump+0x100/0x160
> [  547.812226]  ? exc_page_fault+0x64/0x150
> [  547.816152]  ? asm_exc_page_fault+0x22/0x30
> [  547.820341]  ? r535_gsp_msg_recv+0x87/0x230 [nvkm]
> [  547.825184]  r535_gsp_msgq_work+0x42/0x50 [nvkm]
> [  547.829845]  process_one_work+0x196/0x3d0
> [  547.833861]  worker_thread+0x2fc/0x410
> [  547.837613]  ? __pfx_worker_thread+0x10/0x10
> [  547.841885]  kthread+0xdf/0x110
> [  547.845031]  ? __pfx_kthread+0x10/0x10
> [  547.848775]  ret_from_fork+0x30/0x50
> [  547.852354]  ? __pfx_kthread+0x10/0x10
> [  547.856097]  ret_from_fork_asm+0x1a/0x30
> [  547.860019]  </TASK>
> [  547.862208] Modules linked in: nvkm(E) gsp_log(E) snd_seq_dummy(E) snd=
_hrtimer(E) snd_seq(E) snd_timer(E) snd_seq_device(E) snd(E) soundcore(E) r=
fkill(E) qrtr(E) vfat(E) fat(E) ipmi_ssif(E) amd_atl(E) intel_rapl_msr(E) i=
ntel_rapl_common(E) amd64_edac(E) mlx5_ib(E) edac_mce_amd(E) kvm_amd(E) ib_=
uverbs(E) kvm(E) ib_core(E) acpi_ipmi(E) ipmi_si(E) ipmi_devintf(E) mxm_wmi=
(E) joydev(E) rapl(E) ptdma(E) i2c_piix4(E) acpi_cpufreq(E) wmi_bmof(E) pcs=
pkr(E) k10temp(E) ipmi_msghandler(E) xfs(E) libcrc32c(E) ast(E) i2c_algo_bi=
t(E) drm_shmem_helper(E) crct10dif_pclmul(E) drm_kms_helper(E) ahci(E) crc3=
2_pclmul(E) nvme_tcp(E) libahci(E) nvme(E) crc32c_intel(E) nvme_fabrics(E) =
cdc_ether(E) nvme_core(E) usbnet(E) mlx5_core(E) ghash_clmulni_intel(E) drm=
(E) libata(E) ccp(E) mii(E) t10_pi(E) mlxfw(E) sp5100_tco(E) psample(E) pci=
_hyperv_intf(E) wmi(E) dm_multipath(E) sunrpc(E) dm_mirror(E) dm_region_has=
h(E) dm_log(E) dm_mod(E) be2iscsi(E) bnx2i(E) cnic(E) uio(E) cxgb4i(E) cxgb=
4(E) tls(E) libcxgbi(E) libcxgb(E) qla4xxx(E)
> [  547.862283]  iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi=
(E) scsi_transport_iscsi(E) fuse(E) [last unloaded: gsp_log(E)]
> [  547.962691] CR2: 0000000000000020
> [  547.966003] ---[ end trace 0000000000000000 ]---
> [  549.012012] clocksource: Long readout interval, skipping watchdog chec=
k: cs_nsec: 1370499158 wd_nsec: 1370498904
> [  549.043676] pstore: backend (erst) writing error (-28)
> [  549.050924] RIP: 0010:r535_gsp_msg_recv+0x87/0x230 [nvkm]
> [  549.056389] Code: 00 8b 70 08 48 89 e1 31 d2 4c 89 f7 e8 12 f5 ff ff 4=
8 89 c5 48 85 c0 0f 84 cf 00 00 00 48 81 fd 00 f0 ff ff 0f 87 c4 00 00 00 <=
8b> 55 10 41 8b 46 30 85 d2 0f 85 f6 00 00 00 83 f8 04 76 10 ba 05
> [  549.075138] RSP: 0018:ffffabe440f87e10 EFLAGS: 00010203
> [  549.080361] RAX: 0000000000000010 RBX: 0000000000000008 RCX: 000000000=
000003f
> [  549.087484] RDX: 0000000000000000 RSI: ffffabe4480a8030 RDI: 000000000=
0000010
> [  549.094609] RBP: 0000000000000010 R08: 0000000000000000 R09: ffffabe44=
0f87bb0
> [  549.101733] R10: ffffabe440f87dc8 R11: 0000000000000010 R12: 000000000=
0000000
> [  549.108857] R13: 0000000000000000 R14: ffff9351df1e5000 R15: 000000000=
0000000
> [  549.115982] FS:  0000000000000000(0000) GS:ffff93708eb00000(0000) knlG=
S:0000000000000000
> [  549.124061] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  549.129807] CR2: 0000000000000020 CR3: 00000003cc220002 CR4: 000000000=
0770ef0
> [  549.136940] PKRU: 55555554
> [  549.139653] Kernel panic - not syncing: Fatal exception
> [  549.145054] Kernel Offset: 0x18c00000 from 0xffffffff81000000 (relocat=
ion range: 0xffffffff80000000-0xffffffffbfffffff)
> [  549.165074] ---[ end Kernel panic - not syncing: Fatal exception ]---
>=20
> Also, nvkm wrongly advances the read pointer when handling a two-page GSP
> message in the rollback case. In the rollback case, the GSP message will
> be copied in two rounds. When handling a two-page GSP message, nvkm first
> copies amount of (GSP_PAGE_SIZE - header) data into the buffer, then
> advances the read pointer by the result of DIV_ROUND_UP(size,
> GSP_PAGE_SIZE). Thus, the read pointer is advanced by 1.
>=20
> Next, nvkm copies the amount of (total size - (GSP_PAGE_SIZE -
> header)) data into the buffer. The left amount of the data will be always
> larger than one page since the message header is not taken into account
> in the first copy. Thus, the read pointer is advanced by DIV_ROUND_UP(
> size(larger than one page), GSP_PAGE_SIZE) =3D 2.
>=20
> In the end, the read pointer is wrongly advanced by 3 when handling a
> two-page GSP message in the rollback case.
>=20
> Fix the problems by taking the total size of the message into account
> when advancing the read pointer and calculate the read pointer in the end
> of the all copies for the rollback case.
>=20
> BTW: the two-page GSP message can be observed in the msgq when vGPU is
> enabled.

Thanks for the detailed description!

Do I get it right that with "vanilla nouveau" we're not able to hit this bu=
g?

>=20
> Fixes: 176fdcbddfd28 ("drm/nouveau/gsp/r535: add support for booting GSP-=
RM")

Please make sure to run ./scripts/checkpatch.pl, 'Fixes' uses 12 chars of s=
ha1.

> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index cf58f9da9139..736cde1987d0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -121,6 +121,8 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u3=
2 *prepc, int *ptime)
>  		return mqe->data;
>  	}
> =20
> +	size =3D ALIGN(repc + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
> +
>  	msg =3D kvmalloc(repc, GFP_KERNEL);
>  	if (!msg)
>  		return ERR_PTR(-ENOMEM);
> @@ -129,19 +131,15 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, =
u32 *prepc, int *ptime)
>  	len =3D min_t(u32, repc, len);
>  	memcpy(msg, mqe->data, len);
> =20
> -	rptr +=3D DIV_ROUND_UP(len, GSP_PAGE_SIZE);
> -	if (rptr =3D=3D gsp->msgq.cnt)
> -		rptr =3D 0;
> -
>  	repc -=3D len;
> =20
>  	if (repc) {
>  		mqe =3D (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
>  		memcpy(msg + len, mqe, repc);
> -
> -		rptr +=3D DIV_ROUND_UP(repc, GSP_PAGE_SIZE);
>  	}
> =20
> +	rptr =3D (rptr + DIV_ROUND_UP(size, GSP_PAGE_SIZE)) % gsp->msgq.cnt;
> +
>  	mb();
>  	(*gsp->msgq.rptr) =3D rptr;
>  	return msg;
> --=20
> 2.34.1
>=20
