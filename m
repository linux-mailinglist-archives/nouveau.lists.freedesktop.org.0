Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EFED38820
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:05:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6795D10E948;
	Fri, 16 Jan 2026 21:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CZ5VmA+z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 305A444B97;
	Fri, 16 Jan 2026 20:56:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768597011;
 b=uiXMmgvmD4HxShBfsno+XxsrbIcR0tcnoxCJAGlvLGtz4C5r0GEi7MnFHx7ZYmB8Xycwy
 B93MMuw7A5N/BGx6saDsifTHFh6U4pvQdQm5+PL+uPUuLwmR5ibR+O2P1IlsB5dD/OXFU0D
 0n42haDF2WIkK6dP+ZMRExHohA0HEPJ8bkNGsXVKK1CotpvCHiIs7DMcVVUoprVuYDzLjok
 1QTtvK5q5G3mSEyPa6f4uYuIQUBxlfrxvvubL2Gbn10CdDOFKSXcF+kNDndMMeZtzQ77nKe
 QR3P+9gBpghtDkv6grGZbFIW9MO0cH9ZV9GYWDOl3fU63GNoej09U1HKRUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768597011; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q5SUvcu6ebpPM2PRaqXz5dpJgnteYnc26GMQ8gq1dP8=;
 b=cMVzgL4mTEnv4OyudME+oJ2M2jScOf4e01DTE7ScMpp818MmdEJYsZLIIbSQn4mphKuUU
 rGYn6/4p+QewlH5qyi4L+QMP3cb8DIla9RFxvkFLbfUj5JGKHViVadu9JAkLhMx7JU1Hw7l
 qmsjRFmGrhAN30To8/JzKoceL95810WEaEzGZd4tdh838WVBd8u0i9+0Apo32rgAhxeEvTl
 mYn8ybCJ3T1ba7k4/9cH0bnckFpGa+haecNh3usknIoyzLmB7eHdhFtLx6YUxSJaUxiXnaK
 VuqQaNrXkiK9hgSBbbanzWXkQnRJBai1q6wnTtYdpHCdlDRtfyOGV/VB1hJQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A860F40744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:56:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92FA410E94E
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:05:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88B5060150;
	Fri, 16 Jan 2026 21:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CB7C116C6;
	Fri, 16 Jan 2026 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768597522;
	bh=OTWhNuwoA0ri1yi3waHmvj+OiuXWNzz5QrW5RdAqKB8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=CZ5VmA+zS+KDi4Zg7zVZy4vtW1XXa9PrcY/JqR8FJ7DHZjlHyxMiCBMUx3RsJPzqa
	 bx/ubZh+xu2ZLamEBHQLSqkExLgiaf5DxUGwIrWWbuJqOYMtym7HLnn/2ZlHWJbX0F
	 lY+yB2tqU/sSeXxPt5LHRDrvralffRkV0N7z18y/CyV/Ws0uyOdFTF7hsp6GGSwqZm
	 OvZznf0x4+TDznXCczzz8Zxf2t4mlrg1MFpMzlpPlqcBE0ggHIbrMEPF3De3VIBguM
	 /wyM3yNnSFUI5cZKHpl9qO5LKnXWhfcdlS6/UUfxJK0gluRKzzw84Q4hCU4yUiGlS6
	 f2no8R1V0VirQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 22:05:19 +0100
Message-Id: <DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org>
Subject: Re: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading
 firmware images
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-12-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-12-ttabi@nvidia.com>
Message-ID-Hash: NCI2HDRU4G2J7S4HEH7LI4CZOPHSPMD6
X-Message-ID-Hash: NCI2HDRU4G2J7S4HEH7LI4CZOPHSPMD6
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NCI2HDRU4G2J7S4HEH7LI4CZOPHSPMD6/>
Archived-At: 
 <https://lore.freedesktop.org/DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 8:29 PM CET, Timur Tabi wrote:
> +    /// Write a byte array to Falcon memory using programmed I/O (PIO).
> +    ///
> +    /// Writes `img` to the specified `target_mem` (IMEM or DMEM) starti=
ng at `mem_base`.
> +    /// For IMEM writes, tags are set for each 256-byte block starting f=
rom `tag`.
> +    ///
> +    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
> +    fn pio_wr_bytes(
> +        &self,
> +        bar: &Bar0,
> +        img: &[u8],
> +        mem_base: u16,
> +        target_mem: FalconMem,
> +        port: u8,

This looks like we should use the Bounded type instead.

> +        tag: u16,
> +    ) -> Result {
> +        // Rejecting misaligned images here allows us to avoid checking
> +        // inside the loops.
> +        if img.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let port =3D usize::from(port);
> +
> +        match target_mem {
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> {
> +                regs::NV_PFALCON_FALCON_IMEMC::default()
> +                    .set_secure(target_mem =3D=3D FalconMem::ImemSecure)
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port);
> +
> +                let mut tag =3D tag;
> +                for block in img.chunks(256) {

	for (n, block) in img.chunks(256).iter().enumerate() {
	    regs::NV_PFALCON_FALCON_IMEMT::default()
	        .set_tag(tag + n)
	        .write(bar, &E::ID, port);
	}

This way you don't need the mutable shadow of tag. Besides that, how do we =
know
this doesn't overflow? Don't we need a checked_add()?

> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
> +                        .set_tag(tag)
> +                        .write(bar, &E::ID, port);
> +                    for word in block.chunks_exact(4) {
> +                        let w =3D [word[0], word[1], word[2], word[3]];
> +                        regs::NV_PFALCON_FALCON_IMEMD::default()
> +                            .set_data(u32::from_le_bytes(w))
> +                            .write(bar, &E::ID, port);
> +                    }
> +                    tag +=3D 1;
> +                }
> +            }
> +            FalconMem::Dmem =3D> {
> +                regs::NV_PFALCON_FALCON_DMEMC::default()
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port);
> +
> +                for block in img.chunks(256) {
> +                    for word in block.chunks_exact(4) {
> +                        let w =3D [word[0], word[1], word[2], word[3]];
> +                        regs::NV_PFALCON_FALCON_DMEMD::default()
> +                            .set_data(u32::from_le_bytes(w))
> +                            .write(bar, &E::ID, port);
> +                    }
> +                }
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +
> +    fn pio_wr<F: FalconFirmware<Target =3D E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        target_mem: FalconMem,
> +        load_offsets: &FalconLoadTarget,
> +        port: u8,
> +        tag: u16,
> +    ) -> Result {
> +        let start =3D usize::from_safe_cast(load_offsets.src_start);
> +        let len =3D usize::from_safe_cast(load_offsets.len);
> +        let mem_base =3D u16::try_from(load_offsets.dst_start)?;
> +
> +        // SAFETY: we are the only user of the firmware image at this st=
age
> +        let data =3D unsafe { fw.as_slice(start, len).map_err(|_| EINVAL=
)? };

Why do we need the firmware image to be backed by a DMA object at this poin=
t
when you load the firmware image through PIO anyways?

> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 49501aa6ff7f..3a882b7d8aa8 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -15,6 +15,11 @@
>  mod ga102;
>  mod tu102;
> =20
> +pub(crate) enum LoadMethod {
> +    Pio,
> +    Dma,
> +}

Seems obvious, but still, please add some documentation explaining that thi=
s is
the load method for falcon firmware images, etc.

> +pub(crate) struct GenericBootloader {
> +    pub desc: BootloaderDesc,
> +    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,

	pub ucode: KVec<u8>,

Also, we may want to use KVVec<u8> or just VVec<u8> instead. What's the ima=
ge
size?

> +}
> +
>  /// The FWSEC microcode, extracted from the BIOS and to be run on the GS=
P falcon.
>  ///
>  /// It is responsible for e.g. carving out the WPR2 region as the first =
step of the GSP bootflow.
> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
>      desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
> +    /// Generic bootloader
> +    gen_bootloader: Option<GenericBootloader>,

I'm not convinced this is a good idea. We probably want a HAL here and have
different FwsecFirmware types:

One with a DMA object and one with a system memory object when the architec=
ture
uses PIO. In the latter case the object can have a GenericBootloader field,=
 i.e.
this also gets us rid of the Option and all the subsequent 'if chipset <
Chipset::GA102' checks and 'match gbl_fw' matches below.

>  }
> =20
>  impl FalconLoadParams for FwsecFirmware {
> @@ -275,7 +342,19 @@ fn brom_params(&self) -> FalconBromParams {
>      }
> =20
>      fn boot_addr(&self) -> u32 {
> -        0
> +        match &self.desc {
> +            FalconUCodeDesc::V2(_v2) =3D> {
> +                // On V2 platforms, the boot address is extracted from t=
he
> +                // generic bootloader, because the gbl is what actually =
copies
> +                // FWSEC into memory, so that is what needs to be booted=
.
> +                if let Some(ref gbl) =3D self.gen_bootloader {
> +                    gbl.desc.start_tag << 8
> +                } else {
> +                    0
> +                }
> +            }
> +            FalconUCodeDesc::V3(_v3) =3D> 0,
> +        }
>      }
>  }
> =20
> @@ -376,6 +455,7 @@ impl FwsecFirmware {
>      /// command.
>      pub(crate) fn new(
>          dev: &Device<device::Bound>,
> +        chipset: Chipset,
>          falcon: &Falcon<Gsp>,
>          bar: &Bar0,
>          bios: &Vbios,
> @@ -432,9 +512,54 @@ pub(crate) fn new(
>              ucode_dma.no_patch_signature()
>          };
> =20
> +        // The Generic Bootloader exists only on Turing and GA100.  To a=
void a bogus
> +        // console error message on other platforms, only try to load it=
 if it's
> +        // supposed to be there.
> +        let gbl_fw =3D if chipset < Chipset::GA102 {
> +            Some(super::request_firmware(
> +                dev,
> +                chipset,
> +                "gen_bootloader",
> +                FIRMWARE_VERSION,
> +            )?)
> +        } else {
> +            None
> +        };
> +
> +        let gbl =3D match gbl_fw {
> +            Some(fw) =3D> {
> +                let hdr =3D fw
> +                    .data()
> +                    .get(0..size_of::<BinHdr>())
> +                    .and_then(BinHdr::from_bytes_copy)
> +                    .ok_or(EINVAL)?;
> +
> +                let desc_offset =3D usize::from_safe_cast(hdr.header_off=
set);
> +                let desc =3D fw
> +                    .data()
> +                    .get(desc_offset..desc_offset + size_of::<Bootloader=
Desc>())
> +                    .and_then(BootloaderDesc::from_bytes_copy)
> +                    .ok_or(EINVAL)?;
> +
> +                let ucode_start =3D usize::from_safe_cast(hdr.data_offse=
t);
> +                let ucode_size =3D usize::from_safe_cast(hdr.data_size);
> +                let ucode_data =3D fw
> +                    .data()
> +                    .get(ucode_start..ucode_start + ucode_size)
> +                    .ok_or(EINVAL)?;
> +
> +                let mut ucode =3D KVec::new();
> +                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
> +
> +                Some(GenericBootloader { desc, ucode })
> +            }
> +            None =3D> None,
> +        };
> +
>          Ok(FwsecFirmware {
>              desc,
>              ucode: ucode_signed,
> +            gen_bootloader: gbl,
>          })
>      }
