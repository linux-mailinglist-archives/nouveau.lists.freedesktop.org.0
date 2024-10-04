Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248E990A06
	for <lists+nouveau@lfdr.de>; Fri,  4 Oct 2024 19:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA010EA4B;
	Fri,  4 Oct 2024 17:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IrM/Y1MV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F45110EA4B
 for <nouveau@lists.freedesktop.org>; Fri,  4 Oct 2024 17:16:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FEE25C5A4D;
 Fri,  4 Oct 2024 17:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1043C4CEC6;
 Fri,  4 Oct 2024 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728062193;
 bh=CtJ3Spy9xp+Ex6vU/dkYEnVybish1hsnim+kPkTsnTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IrM/Y1MV7h7nTOQyzn3E9BTnJ0LEBHERSE1y63/JbDfqbSREXQChjQ509bkChE91i
 Ag9iEmFwB8cxIdaNY8Odjf+yqX6ksGR8FDsfl+uVEdkWR7Y5sqqcixilTPJZELxZWM
 M19bpNV6o2V2O/h8Pk71UsGR1uWoAo3tLkMJ6A0/WdJR1nue4mLFIREU/GlsPLZor4
 ezWeF1OdaqPrE+xAVMZJcAacSnao1lF3yi2ooTw+di09VQJ1Kd+uJkRihMRUhMpN4D
 9yeQEX7F4kdzldNi3UJInMmdh0byGBG1s5Y7pl7/0izXU+yI94aKpa7qWYXfuA3/CR
 4CmWtMfdcGb3w==
Date: Fri, 4 Oct 2024 19:16:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 2/3] nvkm/gsp: correctly calculate the available space of
 the GSP cmdq buffer
Message-ID: <ZwAi6oMlVoa82hb2@pollux>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
 <20240922130709.1946893-3-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240922130709.1946893-3-zhiw@nvidia.com>
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

On Sun, Sep 22, 2024 at 06:07:08AM -0700, Zhi Wang wrote:
> r535_gsp_cmdq_push() waits for the available page in the GSP cmdq
> buffer when handling a large RPC request. When it sees at least one
> available page in the cmdq, it quits the waiting with the amount of
> free buffer pages in the queue.
>=20
> Unfortunately, it always takes the [write pointer, buf_size) as
> available buffer pages before rolling back and wrongly calculates the
> size of the data should be copied. Thus, it can overwrite the RPC
> request that GSP is currently reading, which causes GSP hang due
> to corrupted RPC request:
>=20
> [  549.209389] ------------[ cut here ]------------
> [  549.214010] WARNING: CPU: 8 PID: 6314 at drivers/gpu/drm/nouveau/nvkm/=
subdev/gsp/r535.c:116 r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> [  549.225678] Modules linked in: nvkm(E+) gsp_log(E) snd_seq_dummy(E) sn=
d_hrtimer(E) snd_seq(E) snd_timer(E) snd_seq_device(E) snd(E) soundcore(E) =
rfkill(E) qrtr(E) vfat(E) fat(E) ipmi_ssif(E) amd_atl(E) intel_rapl_msr(E) =
intel_rapl_common(E) mlx5_ib(E) amd64_edac(E) edac_mce_amd(E) kvm_amd(E) ib=
_uverbs(E) kvm(E) ib_core(E) acpi_ipmi(E) ipmi_si(E) mxm_wmi(E) ipmi_devint=
f(E) rapl(E) i2c_piix4(E) wmi_bmof(E) joydev(E) ptdma(E) acpi_cpufreq(E) k1=
0temp(E) pcspkr(E) ipmi_msghandler(E) xfs(E) libcrc32c(E) ast(E) i2c_algo_b=
it(E) crct10dif_pclmul(E) drm_shmem_helper(E) nvme_tcp(E) crc32_pclmul(E) a=
hci(E) drm_kms_helper(E) libahci(E) nvme_fabrics(E) crc32c_intel(E) nvme(E)=
 cdc_ether(E) mlx5_core(E) nvme_core(E) usbnet(E) drm(E) libata(E) ccp(E) g=
hash_clmulni_intel(E) mii(E) t10_pi(E) mlxfw(E) sp5100_tco(E) psample(E) pc=
i_hyperv_intf(E) wmi(E) dm_multipath(E) sunrpc(E) dm_mirror(E) dm_region_ha=
sh(E) dm_log(E) dm_mod(E) be2iscsi(E) bnx2i(E) cnic(E) uio(E) cxgb4i(E) cxg=
b4(E) tls(E) libcxgbi(E) libcxgb(E) qla4xxx(E)
> [  549.225752]  iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi=
(E) scsi_transport_iscsi(E) fuse(E) [last unloaded: gsp_log(E)]
> [  549.326293] CPU: 8 PID: 6314 Comm: insmod Tainted: G            E     =
 6.9.0-rc6+ #1
> [  549.334039] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS L3.=
12E 09/06/2022
> [  549.341781] RIP: 0010:r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> [  549.347343] Code: 08 00 00 89 da c1 e2 0c 48 8d ac 11 00 10 00 00 48 8=
b 0c 24 48 85 c9 74 1f c1 e0 0c 4c 8d 6d 30 83 e8 30 89 01 e9 68 ff ff ff <=
0f> 0b 49 c7 c5 92 ff ff ff e9 5a ff ff ff ba ff ff ff ff be c0 0c
> [  549.366090] RSP: 0018:ffffacbccaaeb7d0 EFLAGS: 00010246
> [  549.371315] RAX: 0000000000000000 RBX: 0000000000000012 RCX: 000000000=
0923e28
> [  549.378451] RDX: 0000000000000000 RSI: 0000000055555554 RDI: ffffacbcc=
aaeb730
> [  549.385590] RBP: 0000000000000001 R08: ffff8bd14d235f70 R09: ffff8bd14=
d235f70
> [  549.392721] R10: 0000000000000002 R11: ffff8bd14d233864 R12: 000000000=
0000020
> [  549.399854] R13: ffffacbccaaeb818 R14: 0000000000000020 R15: ffff8bb29=
8c67000
> [  549.406988] FS:  00007f5179244740(0000) GS:ffff8bd14d200000(0000) knlG=
S:0000000000000000
> [  549.415076] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  549.420829] CR2: 00007fa844000010 CR3: 00000001567dc005 CR4: 000000000=
0770ef0
> [  549.427963] PKRU: 55555554
> [  549.430672] Call Trace:
> [  549.433126]  <TASK>
> [  549.435233]  ? __warn+0x7f/0x130
> [  549.438473]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> [  549.443426]  ? report_bug+0x18a/0x1a0
> [  549.447098]  ? handle_bug+0x3c/0x70
> [  549.450589]  ? exc_invalid_op+0x14/0x70
> [  549.454430]  ? asm_exc_invalid_op+0x16/0x20
> [  549.458619]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> [  549.463565]  r535_gsp_msg_recv+0x46/0x230 [nvkm]
> [  549.468257]  r535_gsp_rpc_push+0x106/0x160 [nvkm]
> [  549.473033]  r535_gsp_rpc_rm_ctrl_push+0x40/0x130 [nvkm]
> [  549.478422]  nvidia_grid_init_vgpu_types+0xbc/0xe0 [nvkm]
> [  549.483899]  nvidia_grid_init+0xb1/0xd0 [nvkm]
> [  549.488420]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  549.493213]  nvkm_device_pci_probe+0x305/0x420 [nvkm]
> [  549.498338]  local_pci_probe+0x46/0xa0
> [  549.502096]  pci_call_probe+0x56/0x170
> [  549.505851]  pci_device_probe+0x79/0xf0
> [  549.509690]  ? driver_sysfs_add+0x59/0xc0
> [  549.513702]  really_probe+0xd9/0x380
> [  549.517282]  __driver_probe_device+0x78/0x150
> [  549.521640]  driver_probe_device+0x1e/0x90
> [  549.525746]  __driver_attach+0xd2/0x1c0
> [  549.529594]  ? __pfx___driver_attach+0x10/0x10
> [  549.534045]  bus_for_each_dev+0x78/0xd0
> [  549.537893]  bus_add_driver+0x112/0x210
> [  549.541750]  driver_register+0x5c/0x120
> [  549.545596]  ? __pfx_nvkm_init+0x10/0x10 [nvkm]
> [  549.550224]  do_one_initcall+0x44/0x300
> [  549.554063]  ? do_init_module+0x23/0x240
> [  549.557989]  do_init_module+0x64/0x240
>=20
> Calculate the available buffer page before rolling back based on
> the result from the waiting.

It looks like you hit this one while working on the VFIO stuff too. So, same
question here, can we hit this case with "vanilla nouveau"?

>=20
> Fixes: 176fdcbddfd28 ("drm/nouveau/gsp/r535: add support for booting GSP-=
RM")

Same as in patch 1.

> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 736cde1987d0..49721935013b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -161,7 +161,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
>  	u64 *end;
>  	u64 csum =3D 0;
>  	int free, time =3D 1000000;
> -	u32 wptr, size;
> +	u32 wptr, size, step;
>  	u32 off =3D 0;
> =20
>  	argc =3D ALIGN(GSP_MSG_HDR_SIZE + argc, GSP_PAGE_SIZE);
> @@ -178,11 +178,13 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
>  	cmd->checksum =3D upper_32_bits(csum) ^ lower_32_bits(csum);
> =20
>  	wptr =3D *gsp->cmdq.wptr;
> +

Please remove the addition of empty lines here...

>  	do {
>  		do {
>  			free =3D *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr - 1;
>  			if (free >=3D gsp->cmdq.cnt)
>  				free -=3D gsp->cmdq.cnt;
> +

and here.

>  			if (free >=3D 1)
>  				break;
> =20
> @@ -195,7 +197,9 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
>  		}
> =20
>  		cqe =3D (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
> -		size =3D min_t(u32, argc, (gsp->cmdq.cnt - wptr) * GSP_PAGE_SIZE);
> +		step =3D min_t(u32, free, (gsp->cmdq.cnt - wptr));
> +		size =3D min_t(u32, argc, step * GSP_PAGE_SIZE);
> +
>  		memcpy(cqe, (u8 *)cmd + off, size);
> =20
>  		wptr +=3D DIV_ROUND_UP(size, 0x1000);
> --=20
> 2.34.1
>=20
