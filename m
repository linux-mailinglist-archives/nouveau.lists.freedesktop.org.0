Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D999D2F1
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2024 17:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E02310E478;
	Mon, 14 Oct 2024 15:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TbW7hJYE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7BB10E478
 for <nouveau@lists.freedesktop.org>; Mon, 14 Oct 2024 15:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 905FEA41F28;
 Mon, 14 Oct 2024 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52F0C4CEC7;
 Mon, 14 Oct 2024 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728919918;
 bh=m4/Lbp9gUvfhLwKLfDxL4imJ4fusNjTrJZy75/fdTiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TbW7hJYEJXNhRbFnZyMuZfxPmmljXv05Gq1aGN2820+qZTXRarS6spCblDoX60wsA
 wUp7r2ddizGPSz1cEiCyTyeQ1ZOfzo+VKdkX3XMMpSDoVULCD3qx2Q5cOfb5cLZwDn
 r8er3BA6R3wHULGrQ3W1GofsDMEmgvmhYwqNIOWmDgPfnH+FtFCR/0C4us3UwAPr+e
 jL0pvygKVH0oTFCnKIg4PGd91LSUc8e85MGUTOJPCuS1omg3yv+4+LR/A2Er9h16v4
 9zszz/nrJyphWQLLjNxSOcwZC3O+Hc68LJXzC5R/UQjfFdM+0wDFcOvkAI06PqYCOG
 O7DGFzqfkawTg==
Date: Mon, 14 Oct 2024 17:31:48 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 2/3] nvkm/gsp: correctly calculate the available space of
 the GSP cmdq buffer
Message-ID: <Zw05ZN5khnZLCW7x@pollux>
References: <20240922130709.1946893-1-zhiw@nvidia.com>
 <20240922130709.1946893-3-zhiw@nvidia.com>
 <ZwAi6oMlVoa82hb2@pollux>
 <00670266-2259-4593-a575-e32f814119f1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00670266-2259-4593-a575-e32f814119f1@nvidia.com>
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

On Sun, Oct 13, 2024 at 06:27:32PM +0000, Zhi Wang wrote:
> On 04/10/2024 20.16, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> >=20
> >=20
>=20
> Hey Danilo. I am just back from my vacation. Sorry for the delay. See my=
=20
> comments below.

Hi Zhi. No worries, just so you know I may have a bit of delay in the coming
weeks too -- vacation, relocation...

>=20
> > On Sun, Sep 22, 2024 at 06:07:08AM -0700, Zhi Wang wrote:
> >> r535_gsp_cmdq_push() waits for the available page in the GSP cmdq
> >> buffer when handling a large RPC request. When it sees at least one
> >> available page in the cmdq, it quits the waiting with the amount of
> >> free buffer pages in the queue.
> >>
> >> Unfortunately, it always takes the [write pointer, buf_size) as
> >> available buffer pages before rolling back and wrongly calculates the
> >> size of the data should be copied. Thus, it can overwrite the RPC
> >> request that GSP is currently reading, which causes GSP hang due
> >> to corrupted RPC request:
> >>
> >> [  549.209389] ------------[ cut here ]------------
> >> [  549.214010] WARNING: CPU: 8 PID: 6314 at drivers/gpu/drm/nouveau/nv=
km/subdev/gsp/r535.c:116 r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> >> [  549.225678] Modules linked in: nvkm(E+) gsp_log(E) snd_seq_dummy(E)=
 snd_hrtimer(E) snd_seq(E) snd_timer(E) snd_seq_device(E) snd(E) soundcore(=
E) rfkill(E) qrtr(E) vfat(E) fat(E) ipmi_ssif(E) amd_atl(E) intel_rapl_msr(=
E) intel_rapl_common(E) mlx5_ib(E) amd64_edac(E) edac_mce_amd(E) kvm_amd(E)=
 ib_uverbs(E) kvm(E) ib_core(E) acpi_ipmi(E) ipmi_si(E) mxm_wmi(E) ipmi_dev=
intf(E) rapl(E) i2c_piix4(E) wmi_bmof(E) joydev(E) ptdma(E) acpi_cpufreq(E)=
 k10temp(E) pcspkr(E) ipmi_msghandler(E) xfs(E) libcrc32c(E) ast(E) i2c_alg=
o_bit(E) crct10dif_pclmul(E) drm_shmem_helper(E) nvme_tcp(E) crc32_pclmul(E=
) ahci(E) drm_kms_helper(E) libahci(E) nvme_fabrics(E) crc32c_intel(E) nvme=
(E) cdc_ether(E) mlx5_core(E) nvme_core(E) usbnet(E) drm(E) libata(E) ccp(E=
) ghash_clmulni_intel(E) mii(E) t10_pi(E) mlxfw(E) sp5100_tco(E) psample(E)=
 pci_hyperv_intf(E) wmi(E) dm_multipath(E) sunrpc(E) dm_mirror(E) dm_region=
_hash(E) dm_log(E) dm_mod(E) be2iscsi(E) bnx2i(E) cnic(E) uio(E) cxgb4i(E) =
cxgb4(E) tls(E) libcxgbi(E) libcxgb(E) qla4xxx(E)
> >> [  549.225752]  iscsi_boot_sysfs(E) iscsi_tcp(E) libiscsi_tcp(E) libis=
csi(E) scsi_transport_iscsi(E) fuse(E) [last unloaded: gsp_log(E)]
> >> [  549.326293] CPU: 8 PID: 6314 Comm: insmod Tainted: G            E  =
    6.9.0-rc6+ #1
> >> [  549.334039] Hardware name: ASRockRack 1U1G-MILAN/N/ROMED8-NL, BIOS =
L3.12E 09/06/2022
> >> [  549.341781] RIP: 0010:r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> >> [  549.347343] Code: 08 00 00 89 da c1 e2 0c 48 8d ac 11 00 10 00 00 4=
8 8b 0c 24 48 85 c9 74 1f c1 e0 0c 4c 8d 6d 30 83 e8 30 89 01 e9 68 ff ff f=
f <0f> 0b 49 c7 c5 92 ff ff ff e9 5a ff ff ff ba ff ff ff ff be c0 0c
> >> [  549.366090] RSP: 0018:ffffacbccaaeb7d0 EFLAGS: 00010246
> >> [  549.371315] RAX: 0000000000000000 RBX: 0000000000000012 RCX: 000000=
0000923e28
> >> [  549.378451] RDX: 0000000000000000 RSI: 0000000055555554 RDI: ffffac=
bccaaeb730
> >> [  549.385590] RBP: 0000000000000001 R08: ffff8bd14d235f70 R09: ffff8b=
d14d235f70
> >> [  549.392721] R10: 0000000000000002 R11: ffff8bd14d233864 R12: 000000=
0000000020
> >> [  549.399854] R13: ffffacbccaaeb818 R14: 0000000000000020 R15: ffff8b=
b298c67000
> >> [  549.406988] FS:  00007f5179244740(0000) GS:ffff8bd14d200000(0000) k=
nlGS:0000000000000000
> >> [  549.415076] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [  549.420829] CR2: 00007fa844000010 CR3: 00000001567dc005 CR4: 000000=
0000770ef0
> >> [  549.427963] PKRU: 55555554
> >> [  549.430672] Call Trace:
> >> [  549.433126]  <TASK>
> >> [  549.435233]  ? __warn+0x7f/0x130
> >> [  549.438473]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> >> [  549.443426]  ? report_bug+0x18a/0x1a0
> >> [  549.447098]  ? handle_bug+0x3c/0x70
> >> [  549.450589]  ? exc_invalid_op+0x14/0x70
> >> [  549.454430]  ? asm_exc_invalid_op+0x16/0x20
> >> [  549.458619]  ? r535_gsp_msgq_wait+0xd0/0x190 [nvkm]
> >> [  549.463565]  r535_gsp_msg_recv+0x46/0x230 [nvkm]
> >> [  549.468257]  r535_gsp_rpc_push+0x106/0x160 [nvkm]
> >> [  549.473033]  r535_gsp_rpc_rm_ctrl_push+0x40/0x130 [nvkm]
> >> [  549.478422]  nvidia_grid_init_vgpu_types+0xbc/0xe0 [nvkm]
> >> [  549.483899]  nvidia_grid_init+0xb1/0xd0 [nvkm]
> >> [  549.488420]  ? srso_alias_return_thunk+0x5/0xfbef5
> >> [  549.493213]  nvkm_device_pci_probe+0x305/0x420 [nvkm]
> >> [  549.498338]  local_pci_probe+0x46/0xa0
> >> [  549.502096]  pci_call_probe+0x56/0x170
> >> [  549.505851]  pci_device_probe+0x79/0xf0
> >> [  549.509690]  ? driver_sysfs_add+0x59/0xc0
> >> [  549.513702]  really_probe+0xd9/0x380
> >> [  549.517282]  __driver_probe_device+0x78/0x150
> >> [  549.521640]  driver_probe_device+0x1e/0x90
> >> [  549.525746]  __driver_attach+0xd2/0x1c0
> >> [  549.529594]  ? __pfx___driver_attach+0x10/0x10
> >> [  549.534045]  bus_for_each_dev+0x78/0xd0
> >> [  549.537893]  bus_add_driver+0x112/0x210
> >> [  549.541750]  driver_register+0x5c/0x120
> >> [  549.545596]  ? __pfx_nvkm_init+0x10/0x10 [nvkm]
> >> [  549.550224]  do_one_initcall+0x44/0x300
> >> [  549.554063]  ? do_init_module+0x23/0x240
> >> [  549.557989]  do_init_module+0x64/0x240
> >>
> >> Calculate the available buffer page before rolling back based on
> >> the result from the waiting.
> >=20
> > It looks like you hit this one while working on the VFIO stuff too. So,=
 same
> > question here,
>=20
> Yes. But theses bugs are not specific to vGPU because two-page GSP RPC=20
> are part of valid RPC vehicle format of GSP RPC protocol family. The=20
> fixes are for a better sophisticated GSP RPC handling in Nouveau. Other=
=20
> GSP RPC can use this vehicle format as well.

Yeah, that's fine. I just try to figure out whether we need those patches in
-fixes, or if we can take them through -next.

>=20
> can we hit this case with "vanilla nouveau"?
>=20
> Not yet. But introducing new GSP RPCs that using this vehicle format=20
> (related to vGPU/not-related to vGPU) in nouveau might hit this bug later.

Great, so we can take all three through -next, right?

>=20
> Out of curiostiy, do we have any unit-test package or flows to test the=
=20
> patches? Like CIs.

There's igt_gpu_tools [1], but unfortunately Nouveau has practically no test
cases.

> I am using the Phoronix test suite in the ubuntu with=20
> a PPA repo that has latest mesa/drm userspace libraries.

I typically use Vulkan CTS [2] and some manual smoke testing for the KMS pa=
rts.

However, for the long term I definitely want to get to have proper (unit) t=
ests
additionally.

For Nova we can easily use KUnit tests through examples in the code
documentation. Additionally, I could think of something analogous to
igt_gpu_tools I already played around with for Nova [3].

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools
[2] https://github.com/KhronosGroup/VK-GL-CTS
[3] https://gitlab.freedesktop.org/dakr/drm-test

>=20
> It would be nice that I can align with others. :)
>=20
> Thanks,
> Zhi.
> >=20
>=20
> >>
> >> Fixes: 176fdcbddfd28 ("drm/nouveau/gsp/r535: add support for booting G=
SP-RM")
> >=20
> > Same as in patch 1.
> >=20
> >> Cc: Ben Skeggs <bskeggs@nvidia.com>
> >> Cc: Karol Herbst <kherbst@redhat.com>
> >> Cc: Lyude Paul <lyude@redhat.com>
> >> Cc: Danilo Krummrich <dakr@redhat.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> >> ---
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> index 736cde1987d0..49721935013b 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> >> @@ -161,7 +161,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *arg=
v)
> >>        u64 *end;
> >>        u64 csum =3D 0;
> >>        int free, time =3D 1000000;
> >> -     u32 wptr, size;
> >> +     u32 wptr, size, step;
> >>        u32 off =3D 0;
> >>
> >>        argc =3D ALIGN(GSP_MSG_HDR_SIZE + argc, GSP_PAGE_SIZE);
> >> @@ -178,11 +178,13 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *a=
rgv)
> >>        cmd->checksum =3D upper_32_bits(csum) ^ lower_32_bits(csum);
> >>
> >>        wptr =3D *gsp->cmdq.wptr;
> >> +
> >=20
> > Please remove the addition of empty lines here...
> >=20
> >>        do {
> >>                do {
> >>                        free =3D *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr=
 - 1;
> >>                        if (free >=3D gsp->cmdq.cnt)
> >>                                free -=3D gsp->cmdq.cnt;
> >> +
> >=20
> > and here.
> >=20
> >>                        if (free >=3D 1)
> >>                                break;
> >>
> >> @@ -195,7 +197,9 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *arg=
v)
> >>                }
> >>
> >>                cqe =3D (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wpt=
r * 0x1000);
> >> -             size =3D min_t(u32, argc, (gsp->cmdq.cnt - wptr) * GSP_P=
AGE_SIZE);
> >> +             step =3D min_t(u32, free, (gsp->cmdq.cnt - wptr));
> >> +             size =3D min_t(u32, argc, step * GSP_PAGE_SIZE);
> >> +
> >>                memcpy(cqe, (u8 *)cmd + off, size);
> >>
> >>                wptr +=3D DIV_ROUND_UP(size, 0x1000);
> >> --
> >> 2.34.1
> >>
>=20
