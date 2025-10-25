Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F2C09581
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 18:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C63110E2E4;
	Sat, 25 Oct 2025 16:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pw8gVxDp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD010E2E0
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 16:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7CF0E61106;
 Sat, 25 Oct 2025 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F7EC19422;
 Sat, 25 Oct 2025 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409288;
 bh=CNuXg6T1FBt0H9ahAPfbDf9MKjLact3hI0yEzcJrYmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pw8gVxDpTN1qibdprIeko6/I+bPcQOWkBqR6ikQmD1JSwUXA8KEy6YFTD241QF2ly
 YmFamDoSpBY3gA4qKj8uWNBYKpd9RdpM729bPc2yIZTBDAIdasF1p3QoxDzrDC1esu
 NZyXLdHocobY7s8v7tdJuOYH4yzD3S75PIyA4fhuYLC0SMBJ0I3Gn9RT+xVgOOb2V1
 mlgtqh14R+xUrYf0pYywABgqMy81FBcN4Hv0FZg2i0zI+rQfmcC9pmhfLdGozADQn7
 TbmUHpo4XvE7hyaKmJ0i6fzGLDq/ctU3khh8qmoQnEdVCfUzOO5MZKjth1dFU5wpzi
 KnyHybbtuJ6oQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Sasha Levin <sashal@kernel.org>,
 dakr@kernel.org, aliceryhl@google.com, tamird@gmail.com,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] gpu: nova-core: register: allow fields named
 `offset`
Date: Sat, 25 Oct 2025 11:58:13 -0400
Message-ID: <20251025160905.3857885-262-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Alexandre Courbot <acourbot@nvidia.com>

[ Upstream commit c5aeb264b6b27c52fc6c9ef3b50eaaebff5d9b60 ]

`offset` is a common field name, yet using it triggers a build error due
to the conflict between the uppercased field constant (which becomes
`OFFSET` in this case) containing the bitrange of the field, and the
`OFFSET` constant constaining the offset of the register.

Fix this by adding `_RANGE` the field's range constant to avoid the
name collision.

[acourbot@nvidia.com: fix merge conflict due to switch from `as u32` to
`u32::from`.]

Reported-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://lore.kernel.org/r/20250718-nova-regs-v2-3-7b6a762aa1cd@nvidia.com
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Resolves a hard build error when a register defines a field named
    `offset`. The `register!` macro currently generates an associated
    constant for the field’s bit range named after the field uppercased
    (e.g., `OFFSET`), which collides with the register’s own associated
    constant `OFFSET` that holds the register’s offset (introduced
    earlier). This creates a duplicate associated constant in the same
    type.
  - Root cause: `pub(crate) const OFFSET: usize = $offset;` is emitted
    for every register type (drivers/gpu/nova-core/regs/macros.rs:147),
    while the field bitrange constant is currently emitted as `const
    OFFSET: RangeInclusive<u8> = ...` when the field is named `offset`
    (see below).

- Code changes
  - Rename the generated bitrange constant to avoid collision:
    - Old: `const [<$field:upper>]: RangeInclusive<u8> = $lo..=$hi;`
    - New: `const [<$field:upper _RANGE>]: RangeInclusive<u8> =
      $lo..=$hi;`
    - Location: drivers/gpu/nova-core/regs/macros.rs:281 (change to add
      `_RANGE` suffix).
  - Update call sites that used the old constant name for `.len()`:
    - Change `Self::ARCHITECTURE_0.len()` to
      `Self::ARCHITECTURE_0_RANGE.len()` in NV_PMC_BOOT_0::architecture
      - Location: drivers/gpu/nova-core/regs.rs:31
    - Change `Self::IMPLEMENTATION.len()` to
      `Self::IMPLEMENTATION_RANGE.len()` in NV_PMC_BOOT_0::chipset
      - Location: drivers/gpu/nova-core/regs.rs:39
  - The register offset constant remains unchanged and is still
    available as `pub(crate) const OFFSET: usize = ...`
    (drivers/gpu/nova-core/regs/macros.rs:147). This preserves existing
    uses like `regs::NV_FUSE_OPT_FPF_*::OFFSET` (e.g., drivers/gpu/nova-
    core/falcon/hal/ga102.rs:58, :60, :62).

- Why it matters
  - The register offset constant `OFFSET` (drivers/gpu/nova-
    core/regs/macros.rs:147) was added by commit “gpu: nova-core: expose
    the offset of each register as a type constant.” Without this patch,
    any field named `offset` would generate another associated constant
    `OFFSET` for the field’s bit range, causing a compile-time name
    collision in the same type.
  - Even if current in-tree fields avoid the name `offset` (e.g., use
    `offs` in drivers/gpu/nova-core/regs.rs:250, :265), this is a latent
    build bug that blocks legitimate and common field naming. The commit
    unblocks this and aligns with typical hardware field naming
    conventions.

- Risk and side effects
  - Minimal and contained:
    - Only renames the generated field-bitrange associated constant to
      `<FIELD>_RANGE`.
    - Updates the two in-tree references that used `.len()` on the old
      constant name (drivers/gpu/nova-core/regs.rs:31, :39).
    - No runtime behavior changes; constants are used purely at compile
      time.
  - API stability:
    - This affects only internal, per-register associated constants
      generated by a private macro used within `drivers/gpu/nova-core`.
      No external kernel API/ABI is touched.
    - Tree-wide search shows no other in-tree usage of the old `<FIELD>`
      bitrange associated constant name beyond the two places updated.

- Stable backport criteria
  - Fixes a real (and easy-to-hit) build failure class introduced when
    the `OFFSET` associated constant was added for registers. It is a
    correctness fix, not a new feature.
  - Small, straightforward, and self-contained; no architectural
    changes.
  - Low regression risk; confined to `drivers/gpu/nova-core`.
  - No functional side effects beyond eliminating the name collision and
    updating the two references to the renamed constant.

Conclusion: Suitable for stable. The change is a small macro-level bug
fix eliminating a compile-time name collision, with trivial call-site
updates and no runtime impact.

 drivers/gpu/nova-core/regs.rs        | 5 +++--
 drivers/gpu/nova-core/regs/macros.rs | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d49fddf6a3c6e..c8f8adb24f6e4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -28,7 +28,7 @@ impl NV_PMC_BOOT_0 {
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0.len()),
+            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
         )
     }
 
@@ -36,7 +36,8 @@ pub(crate) fn architecture(self) -> Result<Architecture> {
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
             .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION.len()) | u32::from(self.implementation())
+                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
+                    | u32::from(self.implementation())
             })
             .and_then(Chipset::try_from)
     }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index a3e6de1779d41..00b398522ea18 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -278,7 +278,7 @@ impl $name {
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
-        const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
         );
-- 
2.51.0

